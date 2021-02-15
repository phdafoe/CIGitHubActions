module Fastlane
  module Actions
    module SharedValues
      TESTFAIRY_BUILD_URL = :TESTFAIRY_BUILD_URL
    end

    class TestfairyAction < Action
      def self.run(params)
        require 'shenzhen'
        require 'shenzhen/plugins/testfairy'

        UI.success('Starting with ipa upload to TestFairy...')

        client = Shenzhen::Plugins::TestFairy::Client.new(
          params[:api_key]
        )

        return params[:ipa] if Helper.test?

        client_options = params.values
        client_options[:testers_groups] = params[:testers_groups].join(',')

        response = client.upload_build(params[:ipa], client_options)
        if parse_response(response)
          UI.success("Build URL: #{Actions.lane_context[SharedValues::TESTFAIRY_BUILD_URL]}")
          UI.success("Build successfully uploaded to TestFairy.")
        else
          UI.user_error!("Error when trying to upload ipa to TestFairy")
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.parse_response(response)
        if response.body && response.body.key?('status') && response.body['status'] == 'ok'
          build_url = response.body['build_url']

          Actions.lane_context[SharedValues::TESTFAIRY_BUILD_URL] = build_url

          return true
        else
          UI.error("Error uploading to TestFairy: #{response.body}")

          return false
        end
      end
      private_class_method :parse_response

      def self.description
        'Upload a new build to TestFairy'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       env_name: "FL_TESTFAIRY_API_KEY", # The name of the environment variable
                                       description: "API Key for TestFairy", # a short description of this parameter
                                       verify_block: proc do |value|
                                         UI.user_error!("No API key for TestFairy given, pass using `api_key: 'key'`") unless value.to_s.length > 0
                                       end),
          FastlaneCore::ConfigItem.new(key: :ipa,
                                       env_name: 'TESTFAIRY_IPA_PATH',
                                       description: 'Path to your IPA file. Optional if you use the `gym` or `xcodebuild` action',
                                       default_value: Actions.lane_context[SharedValues::IPA_OUTPUT_PATH],
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find ipa file at path '#{value}'") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :comment,
                                       env_name: "FL_TESTFAIRY_COMMENT",
                                       description: "Additional release notes for this upload. This text will be added to email notifications",
                                       default_value: 'No comment provided'), # the default value if the user didn't provide one
          FastlaneCore::ConfigItem.new(key: :testers_groups,
                                       type: Array,
                                       short_option: '-g',
                                       env_name: "FL_TESTFAIRY_TESTERS_GROUPS",
                                       description: "Array of tester groups to be notified",
                                       default_value: []) # the default value is an empty list
        ]
      end

      def self.output
        [
          ['TESTFAIRY_BUILD_URL', 'URL of the newly uploaded build']
        ]
      end

      def self.authors
        ["taka0125"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
