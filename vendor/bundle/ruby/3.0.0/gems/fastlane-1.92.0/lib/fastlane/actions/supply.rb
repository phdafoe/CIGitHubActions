module Fastlane
  module Actions
    class SupplyAction < Action
      def self.run(params)
        require 'supply'
        require 'supply/options'

        begin
          FastlaneCore::UpdateChecker.start_looking_for_update('supply') unless Helper.is_test?

          all_apk_paths = Actions.lane_context[SharedValues::GRADLE_ALL_APK_OUTPUT_PATHS] || []
          if all_apk_paths.length > 1
            params[:apk_paths] ||= all_apk_paths
          else
            params[:apk] ||= Actions.lane_context[SharedValues::GRADLE_APK_OUTPUT_PATH]
          end

          Supply.config = params # we already have the finished config

          Supply::Uploader.new.perform_upload
        ensure
          FastlaneCore::UpdateChecker.show_update_status('supply', Supply::VERSION)
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Upload metadata, screenshots and binaries to Google Play"
      end

      def self.details
        "More information: https://github.com/fastlane/fastlane/tree/master/supply"
      end

      def self.available_options
        require 'supply'
        require 'supply/options'
        Supply::Options.available_options
      end

      def self.output
      end

      def self.return_value
        # If you method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["KrauseFx"]
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
