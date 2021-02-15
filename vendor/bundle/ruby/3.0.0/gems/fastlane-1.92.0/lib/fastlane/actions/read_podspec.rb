module Fastlane
  module Actions
    module SharedValues
      READ_PODSPEC_JSON = :READ_PODSPEC_JSON
    end

    class ReadPodspecAction < Action
      def self.run(params)
        Actions.verify_gem!('cocoapods')

        path = params[:path]

        require 'cocoapods-core'
        spec = Pod::Spec.from_file(path).to_hash

        UI.success("Reading podspec from file #{path}")

        Actions.lane_context[SharedValues::READ_PODSPEC_JSON] = spec
        return spec
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Loads a CocoaPods spec as JSON"
      end

      def self.details
        [
          "This can be used for only specifying a version string in your podspec",
          "- and during your release process you'd read it from the podspec by running",
          "`version = read_podspec['version']` at the beginning of your lane"
        ].join("\n")
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "FL_READ_PODSPEC_PATH",
                                       description: "Path to the podspec to be read",
                                       default_value: Dir['*.podspec*'].first,
                                       verify_block: proc do |value|
                                         UI.user_error!("File #{value} not found") unless File.exist?(value)
                                       end)
        ]
      end

      def self.output
        [
          ['READ_PODSPEC_JSON', 'Podspec JSON payload']
        ]
      end

      def self.authors
        ["czechboy0"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
