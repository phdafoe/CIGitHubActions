module Fastlane
  module Actions
    class SetPodKeyAction < Action
      def self.run(params)
        Actions.verify_gem!('cocoapods-keys')
        cmd = []

        cmd << ['bundle exec'] if File.exist?('Gemfile') && params[:use_bundle_exec]
        cmd << ['pod keys set']

        cmd << ["\"#{params[:key].shellescape}\""]
        cmd << ["\"#{params[:value].shellescape}\""]
        cmd << ["\"#{params[:project].shellescape}\""] if params[:project]

        Actions.sh(cmd.join(' '))
      end

      def self.author
        "marcelofabri"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Sets a value for a key with cocoapods-keys"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :use_bundle_exec,
                                       env_name: "FL_SET_POD_KEY_USE_BUNDLE_EXEC",
                                       description: "Use bundle exec when there is a Gemfile presented",
                                       is_string: false,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :key,
                                       env_name: "FL_SET_POD_KEY_ITEM_KEY",
                                       description: "The key to be saved with cocoapods-keys",
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :value,
                                       env_name: "FL_SET_POD_KEY_ITEM_VALUE",
                                       description: "The value to be saved with cocoapods-keys",
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :project,
                                       env_name: "FL_SET_POD_KEY_PROJECT",
                                       description: "The project name",
                                       is_string: true,
                                       optional: true)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include? platform
      end
    end
  end
end
