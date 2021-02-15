module Deliver
  class Setup
    def run(options)
      containing = (File.directory?("fastlane") ? 'fastlane' : '.')
      file_path = File.join(containing, 'Deliverfile')
      data = generate_deliver_file(containing, options)
      setup_deliver(file_path, data, containing, options)
    end

    def setup_deliver(file_path, data, deliver_path, options)
      File.write(file_path, data)

      unless options[:skip_screenshots]
        download_screenshots(deliver_path, options)

        # Add a README to the screenshots folder
        FileUtils.mkdir_p File.join(deliver_path, 'screenshots') # just in case the fetching didn't work
        File.write(File.join(deliver_path, 'screenshots', 'README.txt'), File.read("#{Deliver::ROOT}/lib/assets/ScreenshotsHelp"))
      end

      UI.success("Successfully created new Deliverfile at path '#{file_path}'")
    end

    # This method takes care of creating a new 'deliver' folder, containg the app metadata
    # and screenshots folders
    def generate_deliver_file(deliver_path, options)
      v = options[:app].latest_version
      generate_metadata_files(v, File.join(deliver_path, 'metadata'))

      # Generate the final Deliverfile here
      deliver = File.read("#{Deliver::ROOT}/lib/assets/DeliverfileDefault")
      deliver.gsub!("[[APP_IDENTIFIER]]", options[:app].bundle_id)
      deliver.gsub!("[[USERNAME]]", Spaceship::Tunes.client.user)
      return deliver
    end

    def generate_metadata_files(v, path)
      app_details = v.application.details

      # All the localised metadata
      (UploadMetadata::LOCALISED_VERSION_VALUES + UploadMetadata::LOCALISED_APP_VALUES).each do |key|
        v.description.languages.each do |language|
          if UploadMetadata::LOCALISED_VERSION_VALUES.include?(key)
            content = v.send(key)[language].to_s
          else
            content = app_details.send(key)[language].to_s
          end
          content << "\n"
          resulting_path = File.join(path, language, "#{key}.txt")
          FileUtils.mkdir_p(File.expand_path('..', resulting_path))
          File.write(resulting_path, content)
          UI.message("Writing to '#{resulting_path}'")
        end
      end

      # All non-localised metadata
      (UploadMetadata::NON_LOCALISED_VERSION_VALUES + UploadMetadata::NON_LOCALISED_APP_VALUES).each do |key|
        if UploadMetadata::NON_LOCALISED_VERSION_VALUES.include?(key)
          content = v.send(key).to_s
        else
          content = app_details.send(key).to_s
        end
        content << "\n"
        resulting_path = File.join(path, "#{key}.txt")
        File.write(resulting_path, content)
        UI.message("Writing to '#{resulting_path}'")
      end

      UI.success("Successfully created new configuration files.")
    end

    def download_screenshots(deliver_path, options)
      path = File.join(deliver_path, 'screenshots')
      FileUtils.mkdir_p(path)
      Deliver::DownloadScreenshots.run(options, path)
    end
  end
end
