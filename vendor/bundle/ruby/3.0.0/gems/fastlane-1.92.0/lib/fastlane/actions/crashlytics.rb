module Fastlane
  module Actions
    class CrashlyticsAction < Action
      def self.run(params)
        params[:groups] = params[:groups].join(",") if params[:groups].kind_of?(Array)
        params[:emails] = params[:emails].join(",") if params[:emails].kind_of?(Array)

        params.values # to validate all inputs before looking for the ipa/apk

        # We need to store notes in a file, because the crashlytics CLI (iOS) says so
        if params[:notes]
          UI.error("Overwriting :notes_path, because you specified :notes") if params[:notes_path]

          params[:notes_path] = Helper::CrashlyticsHelper.write_to_tempfile(params[:notes], 'changelog').path
        elsif Actions.lane_context[SharedValues::FL_CHANGELOG] && !params[:notes_path]
          UI.message("Sending FL_CHANGELOG as release notes to Beta by Crashlytics")

          params[:notes_path] = Helper::CrashlyticsHelper.write_to_tempfile(
            Actions.lane_context[SharedValues::FL_CHANGELOG], 'changelog').path
        end

        if params[:ipa_path]
          command = Helper::CrashlyticsHelper.generate_ios_command(params)
        elsif params[:apk_path]
          command = Helper::CrashlyticsHelper.generate_android_command(params)
        else
          UI.user_error!("You have to either pass an ipa or an apk file to the Crashlytics action")
        end

        UI.success('Uploading the build to Crashlytics Beta. Time for some ☕️.')

        sanitizer = proc do |message|
          message.gsub(params[:api_token], '[[API_TOKEN]]')
                 .gsub(params[:build_secret], '[[BUILD_SECRET]]')
        end

        UI.verbose sanitizer.call(command.join(' ')) if $verbose

        error_callback = proc do |error|
          clean_error = sanitizer.call(error)
          UI.error(clean_error)
        end

        result = Actions.sh_control_output(
          command.join(" "),
          print_command: false,
          print_command_output: false,
          error_callback: error_callback)

        return command if Helper.test?

        UI.verbose sanitizer.call(result) if $verbose

        UI.success('Build successfully uploaded to Crashlytics Beta 🌷')
      end

      def self.description
        "Upload a new build to Crashlytics Beta"
      end

      def self.available_options
        platform = Actions.lane_context[Actions::SharedValues::PLATFORM_NAME]

        if platform == :ios or platform.nil?
          ipa_path_default = Dir["*.ipa"].last
        end

        if platform == :android
          apk_path_default = Dir["*.apk"].last || Dir[File.join("app", "build", "outputs", "apk", "app-release.apk")].last
        end

        [
          # iOS Specific
          FastlaneCore::ConfigItem.new(key: :ipa_path,
                                       env_name: "CRASHLYTICS_IPA_PATH",
                                       description: "Path to your IPA file. Optional if you use the `gym` or `xcodebuild` action",
                                       default_value: Actions.lane_context[SharedValues::IPA_OUTPUT_PATH] || ipa_path_default,
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find ipa file at path '#{value}'") unless File.exist?(value)
                                       end),
          # Android Specific
          FastlaneCore::ConfigItem.new(key: :apk_path,
                                       env_name: "CRASHLYTICS_APK_PATH",
                                       description: "Path to your APK file",
                                       default_value: Actions.lane_context[SharedValues::GRADLE_APK_OUTPUT_PATH] || apk_path_default,
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find apk file at path '#{value}'") unless File.exist?(value)
                                       end),
          # General
          FastlaneCore::ConfigItem.new(key: :crashlytics_path,
                                       env_name: "CRASHLYTICS_FRAMEWORK_PATH",
                                       description: "Path to the submit binary in the Crashlytics bundle (iOS) or `crashlytics-devtools.jar` file (Android)",
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find crashlytics at path '#{File.expand_path(value)}'`") unless File.exist?(File.expand_path(value))
                                       end),
          FastlaneCore::ConfigItem.new(key: :api_token,
                                       env_name: "CRASHLYTICS_API_TOKEN",
                                       description: "Crashlytics Beta API Token",
                                       verify_block: proc do |value|
                                         UI.user_error!("No API token for Crashlytics given, pass using `api_token: 'token'`") unless value && !value.empty?
                                       end),
          FastlaneCore::ConfigItem.new(key: :build_secret,
                                       env_name: "CRASHLYTICS_BUILD_SECRET",
                                       description: "Crashlytics Build Secret",
                                       verify_block: proc do |value|
                                         UI.user_error!("No build secret for Crashlytics given, pass using `build_secret: 'secret'`") unless value && !value.empty?
                                       end),
          FastlaneCore::ConfigItem.new(key: :notes_path,
                                       env_name: "CRASHLYTICS_NOTES_PATH",
                                       description: "Path to the release notes",
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Path '#{value}' not found") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :notes,
                                       env_name: "CRASHLYTICS_NOTES",
                                       description: "The release notes as string - uses :notes_path under the hood",
                                       optional: true,
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :groups,
                                       env_name: "CRASHLYTICS_GROUPS",
                                       description: "The groups used for distribution, separated by commas",
                                       optional: true,
                                       is_string: false),
          FastlaneCore::ConfigItem.new(key: :emails,
                                       env_name: "CRASHLYTICS_EMAILS",
                                       description: "Pass email addresses of testers, separated by commas",
                                       optional: true,
                                       is_string: false),
          FastlaneCore::ConfigItem.new(key: :notifications,
                                       env_name: "CRASHLYTICS_NOTIFICATIONS",
                                       description: "Crashlytics notification option (true/false)",
                                       default_value: true,
                                       is_string: false),
          FastlaneCore::ConfigItem.new(key: :debug,
                                       env_name: "CRASHLYTICS_DEBUG",
                                       description: "Crashlytics debug option (true/false)",
                                       default_value: false,
                                       is_string: false)

        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac, :android].include?(platform)
      end

      def self.author
        ["KrauseFx", "pedrogimenez"]
      end
    end
  end
end
