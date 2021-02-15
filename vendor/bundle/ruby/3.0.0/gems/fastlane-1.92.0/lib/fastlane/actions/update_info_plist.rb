module Fastlane
  module Actions
    module SharedValues
    end

    class UpdateInfoPlistAction < Action
      def self.run(params)
        require 'plist'

        # Check if parameters are set
        if params[:app_identifier] or params[:display_name] or params[:block]
          if (params[:app_identifier] or params[:display_name]) and params[:block]
            UI.important("block parameter can not be specified with app_identifier or display_name")
            return false
          end

          # Assign folder from parameter or search for xcodeproj file
          folder = params[:xcodeproj] || Dir["*.xcodeproj"].first

          # Read existing plist file
          info_plist_path = File.join(folder, "..", params[:plist_path])
          UI.user_error!("Couldn't find info plist file at path '#{params[:plist_path]}'") unless File.exist?(info_plist_path)
          plist = Plist.parse_xml(info_plist_path)

          # Update plist values
          plist['CFBundleIdentifier'] = params[:app_identifier] if params[:app_identifier]
          plist['CFBundleDisplayName'] = params[:display_name] if params[:display_name]
          params[:block].call(plist) if params[:block]

          # Write changes to file
          plist_string = Plist::Emit.dump(plist)
          File.write(info_plist_path, plist_string)

          UI.success("Updated #{params[:plist_path]} 💾.")
          plist_string
        else
          UI.important("You haven't specified any parameters to update your plist.")
          false
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.is_supported?(platform)
        [:ios].include?(platform)
      end

      def self.description
        'Update a Info.plist file with bundle identifier and display name'
      end

      def self.available_options
        [

          FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                       env_name: "FL_UPDATE_PLIST_PROJECT_PATH",
                                       description: "Path to your Xcode project",
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Please pass the path to the project, not the workspace") if value.end_with? ".xcworkspace"
                                         UI.user_error!("Could not find Xcode project") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :plist_path,
                                       env_name: "FL_UPDATE_PLIST_PATH",
                                       description: "Path to info plist",
                                       verify_block: proc do |value|
                                         UI.user_error!("Invalid plist file") unless value[-6..-1].casecmp(".plist").zero?
                                       end),
          FastlaneCore::ConfigItem.new(key: :app_identifier,
                                       env_name: 'FL_UPDATE_PLIST_APP_IDENTIFIER',
                                       description: 'The App Identifier of your app',
                                       default_value: ENV['PRODUCE_APP_IDENTIFIER'],
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :display_name,
                                       env_name: 'FL_UPDATE_PLIST_DISPLAY_NAME',
                                       description: 'The Display Name of your app',
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :block,
                                       is_string: false,
                                       description: 'A block to process plist with custom logic',
                                       optional: true)

        ]
      end

      def self.author
        'tobiasstrebitzer'
      end
    end
  end
end
