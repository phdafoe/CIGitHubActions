module Fastlane
  module Actions
    module SharedValues
      DSYM_PATHS = :DSYM_PATHS
    end

    class DownloadDsymsAction < Action
      def self.run(params)
        require 'spaceship'
        require 'net/http'

        UI.message("Login to iTunes Connect (#{params[:username]})")
        Spaceship::Tunes.login(params[:username])
        Spaceship::Tunes.select_team
        UI.message("Login successful")

        version = params[:version]
        build_number = params[:build_number]

        message = []
        message << "Looking for dSYM files for #{params[:app_identifier]}"
        if version
          message << "v#{version}"
        end

        if build_number
          message << "(#{build_number})"
        end

        UI.message(message.join(" "))
        app = Spaceship::Application.find(params[:app_identifier])
        unless app
          UI.user_error!("Could not find app with bundle identifier '#{params[:app_identifier]}' on account #{params[:username]}")
        end

        app.all_build_train_numbers.each do |train_number|
          if version && version != train_number
            next
          end
          app.all_builds_for_train(train: train_number).each do |build|
            if build_number && build.build_version != build_number
              next
            end
            download_url = build.details.dsym_url
            if download_url
              result = self.download download_url
              file_name = "#{app.bundle_id}-#{train_number}-#{build.build_version}.dSYM.zip"
              File.write(file_name, result)
              UI.success("🔑  Successfully downloaded dSYM file for #{train_number} - #{build.build_version} to '#{file_name}'")

              Actions.lane_context[SharedValues::DSYM_PATHS] ||= []
              Actions.lane_context[SharedValues::DSYM_PATHS] << File.expand_path(file_name)
            else
              UI.message("No dSYM URL for #{build.build_version} (#{build.train_version})")
            end
          end
        end

        if (Actions.lane_context[SharedValues::DSYM_PATHS] || []).count == 0
          UI.error("No dSYM files found on iTunes Connect - this usually happens when no recompling happened yet")
        end
      end

      def self.download(url)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        res = http.get(uri.request_uri)
        res.body
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Download dSYM files from Apple iTunes Connect for Bitcode apps"
      end

      def self.details
        [
          "This action downloads dSYM files from Apple iTunes Connect after",
          "the ipa got re-compiled by Apple. Useful if you have Bitcode enabled"
        ].join(" ")
      end

      def self.available_options
        user = CredentialsManager::AppfileConfig.try_fetch_value(:itunes_connect_id)
        user ||= CredentialsManager::AppfileConfig.try_fetch_value(:apple_id)

        [
          FastlaneCore::ConfigItem.new(key: :username,
                                       short_option: "-u",
                                       env_name: "DOWNLOAD_DSYMS_USERNAME",
                                       description: "Your Apple ID Username for iTunes Connect",
                                       default_value: user),
          FastlaneCore::ConfigItem.new(key: :app_identifier,
                                       short_option: "-a",
                                       env_name: "DOWNLOAD_DSYMS_APP_IDENTIFIER",
                                       description: "The bundle identifier of your app",
                                       optional: true,
                                       default_value: CredentialsManager::AppfileConfig.try_fetch_value(:app_identifier)),
          FastlaneCore::ConfigItem.new(key: :team_id,
                                       short_option: "-k",
                                       env_name: "DOWNLOAD_DSYMS_TEAM_ID",
                                       description: "The ID of your team if you're in multiple teams",
                                       optional: true,
                                       is_string: false, # as we also allow integers, which we convert to strings anyway
                                       default_value: CredentialsManager::AppfileConfig.try_fetch_value(:itc_team_id),
                                       verify_block: proc do |value|
                                         ENV["FASTLANE_ITC_TEAM_ID"] = value.to_s
                                       end),
          FastlaneCore::ConfigItem.new(key: :team_name,
                                       short_option: "-e",
                                       env_name: "DOWNLOAD_DSYMS_TEAM_NAME",
                                       description: "The name of your team if you're in multiple teams",
                                       optional: true,
                                       default_value: CredentialsManager::AppfileConfig.try_fetch_value(:itc_team_name),
                                       verify_block: proc do |value|
                                         ENV["FASTLANE_ITC_TEAM_NAME"] = value
                                       end),
          FastlaneCore::ConfigItem.new(key: :version,
                                       short_option: "-v",
                                       env_name: "DOWNLOAD_DSYMS_VERSION",
                                       description: "The app version for dSYMs you wish to download",
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :build_number,
                                       short_option: "-b",
                                       env_name: "DOWNLOAD_DSYMS_BUILD_NUMBER",
                                       description: "The app build_number for dSYMs you wish to download",
                                       optional: true)
        ]
      end

      def self.output
        [
          ['DSYM_PATHS', 'An array to all the zipped dSYM files']
        ]
      end

      def self.return_value
        nil
      end

      def self.authors
        ["KrauseFx"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
