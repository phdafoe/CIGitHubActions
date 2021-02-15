module Fastlane
  class Runner
    # Symbol for the current lane
    attr_accessor :current_lane

    # Symbol for the current platform
    attr_accessor :current_platform

    # @return [Hash] All the lanes available, first the platform, then the lane
    attr_accessor :lanes

    def full_lane_name
      [current_platform, current_lane].reject(&:nil?).join(' ')
    end

    # This will take care of executing **one** lane. That's when the user triggers a lane from the CLI for example
    # This method is **not** executed when switching a lane
    # @param lane_name The name of the lane to execute
    # @param platform The name of the platform to execute
    # @param parameters [Hash] The parameters passed from the command line to the lane
    # rubocop:disable Metrics/AbcSize
    def execute(lane, platform = nil, parameters = nil)
      UI.crash!("No lane given") unless lane

      self.current_lane = lane.to_sym
      self.current_platform = (platform ? platform.to_sym : nil)

      lane_obj = lanes.fetch(current_platform, {}).fetch(current_lane, nil)

      UI.user_error!("Could not find lane '#{full_lane_name}'. Available lanes: #{available_lanes.join(', ')}") unless lane_obj
      UI.user_error!("You can't call the private lane '#{lane}' directly") if lane_obj.is_private

      ENV["FASTLANE_LANE_NAME"] = current_lane.to_s
      ENV["FASTLANE_PLATFORM_NAME"] = (current_platform ? current_platform.to_s : nil)

      Actions.lane_context[Actions::SharedValues::PLATFORM_NAME] = current_platform
      Actions.lane_context[Actions::SharedValues::LANE_NAME] = full_lane_name

      UI.success "Driving the lane '#{full_lane_name}' 🚀"

      return_val = nil

      path_to_use = Fastlane::FastlaneFolder.path || Dir.pwd
      parameters ||= {}
      begin
        Dir.chdir(path_to_use) do # the file is located in the fastlane folder
          execute_flow_block(before_all_blocks, current_platform, current_lane, parameters)
          execute_flow_block(before_each_blocks, current_platform, current_lane, parameters)

          return_val = lane_obj.call(parameters) # by default no parameters

          # after blocks are only called if no exception was raised before
          # Call the platform specific after block and then the general one
          execute_flow_block(after_each_blocks, current_platform, current_lane, parameters)
          execute_flow_block(after_all_blocks, current_platform, current_lane, parameters)
        end

        return return_val
      rescue => ex
        Dir.chdir(path_to_use) do
          # Provide error block exception without colour code
          error_ex = ex.exception(ex.message.gsub(/\033\[\d+m/, ''))

          error_blocks[current_platform].call(current_lane, error_ex, parameters) if error_blocks[current_platform] && current_platform
          error_blocks[nil].call(current_lane, error_ex, parameters) if error_blocks[nil]
        end

        raise ex
      end
    end
    # rubocop:enable Metrics/AbcSize

    # @param filter_platform: Filter, to only show the lanes of a given platform
    # @return an array of lanes (platform lane_name) to print them out to the user
    def available_lanes(filter_platform = nil)
      all = []
      lanes.each do |platform, platform_lanes|
        next if filter_platform && filter_platform.to_s != platform.to_s # skip actions that don't match

        platform_lanes.each do |lane_name, lane|
          all << [platform, lane_name].reject(&:nil?).join(' ') unless lane.is_private
        end
      end
      all
    end

    # This is being called from `method_missing` from the Fastfile
    # It's also used when an action is called from another action
    def trigger_action_by_name(method_sym, custom_dir, *arguments)
      method_str = method_sym.to_s
      method_str.delete!('?') # as a `?` could be at the end of the method name

      # First, check if there is a predefined method in the actions folder
      class_name = method_str.fastlane_class + 'Action'
      class_ref = nil
      begin
        class_ref = Fastlane::Actions.const_get(class_name)
      rescue NameError
        # Action not found
        # Is there a lane under this name?
        return self.try_switch_to_lane(method_sym, arguments)
      end

      # It's important to *not* have this code inside the rescue block
      # otherwise all NameErrors will be caugth and the error message is
      # confusing
      if class_ref && class_ref.respond_to?(:run)
        # Action is available, now execute it
        return self.execute_action(method_sym, class_ref, arguments, custom_dir: custom_dir)
      else
        UI.user_error!("Action '#{method_sym}' of class '#{class_name}' was found, but has no `run` method.")
      end
    end

    #
    # All the methods that are usually called on execution
    #

    def try_switch_to_lane(new_lane, parameters)
      block = lanes.fetch(current_platform, {}).fetch(new_lane, nil)
      block ||= lanes.fetch(nil, {}).fetch(new_lane, nil) # fallback to general lane for multiple platforms
      if block
        original_full = full_lane_name
        original_lane = current_lane

        UI.user_error!("Parameters for a lane must always be a hash") unless (parameters.first || {}).kind_of? Hash

        execute_flow_block(before_each_blocks, current_platform, new_lane, parameters)

        pretty = [new_lane]
        pretty = [current_platform, new_lane] if current_platform
        Actions.execute_action("Switch to #{pretty.join(' ')} lane") {} # log the action
        UI.success "Cruising over to lane '#{pretty.join(' ')}' 🚖"

        # Actually switch lane now
        self.current_lane = new_lane
        collector.did_launch_action(:lane_switch)
        result = block.call(parameters.first || {}) # to always pass a hash
        self.current_lane = original_lane

        # after blocks are only called if no exception was raised before
        # Call the platform specific after block and then the general one
        execute_flow_block(after_each_blocks, current_platform, new_lane, parameters)

        UI.success "Cruising back to lane '#{original_full}' 🚘".green
        return result
      else
        # No action and no lane, raising an exception now
        UI.error caller.join("\n")
        UI.user_error!("Could not find action or lane '#{new_lane}'. Check out the README for more details: https://github.com/fastlane/fastlane/tree/master/fastlane")
      end
    end

    def execute_action(method_sym, class_ref, arguments, custom_dir: nil)
      custom_dir ||= '..'
      collector.did_launch_action(method_sym)

      verify_supported_os(method_sym, class_ref)

      begin
        Dir.chdir(custom_dir) do # go up from the fastlane folder, to the project folder
          Actions.execute_action(class_ref.step_text) do
            # arguments is an array by default, containing an hash with the actual parameters
            # Since we usually just need the passed hash, we'll just use the first object if there is only one
            if arguments.count == 0
              arguments = ConfigurationHelper.parse(class_ref, {}) # no parameters => empty hash
            elsif arguments.count == 1 and arguments.first.kind_of? Hash
              arguments = ConfigurationHelper.parse(class_ref, arguments.first) # Correct configuration passed
            elsif !class_ref.available_options
              # This action does not use the new action format
              # Just passing the arguments to this method
            else
              UI.user_error!("You have to call the integration like `#{method_sym}(key: \"value\")`. Run `fastlane action #{method_sym}` for all available keys. Please check out the current documentation on GitHub.")
            end

            class_ref.runner = self # needed to call another action form an action
            class_ref.run(arguments)
          end
        end
      rescue FastlaneCore::Interface::FastlaneError => e # user_error!
        collector.did_raise_error(method_sym)
        raise e
      rescue => e # high chance this is actually FastlaneCore::Interface::FastlaneCrash, but can be anything else
        collector.did_crash(method_sym)
        raise e
      end
    end

    def execute_flow_block(block, current_platform, lane, parameters)
      # Call the platform specific block and default back to the general one
      block[current_platform].call(lane, parameters) if block[current_platform] && current_platform
      block[nil].call(lane, parameters) if block[nil]
    end

    def verify_supported_os(name, class_ref)
      if class_ref.respond_to?(:is_supported?)
        if Actions.lane_context[Actions::SharedValues::PLATFORM_NAME]
          # This value is filled in based on the executed platform block. Might be nil when lane is in root of Fastfile
          platform = Actions.lane_context[Actions::SharedValues::PLATFORM_NAME]

          unless class_ref.is_supported?(platform)
            UI.user_error!("Action '#{name}' doesn't support required operating system '#{platform}'.")
          end
        end
      end
    end

    def collector
      @collector ||= ActionCollector.new
    end

    # Fastfile was finished executing
    def did_finish
      collector.did_finish
    end

    # Called internally to setup the runner object
    #

    # @param lane [Lane] A lane object
    def add_lane(lane, override = false)
      lanes[lane.platform] ||= {}

      if !override and lanes[lane.platform][lane.name]
        UI.user_error!("Lane '#{lane.name}' was defined multiple times!")
      end

      lanes[lane.platform][lane.name] = lane
    end

    def set_before_each(platform, block)
      before_each_blocks[platform] = block
    end

    def set_after_each(platform, block)
      after_each_blocks[platform] = block
    end

    def set_before_all(platform, block)
      before_all_blocks[platform] = block
    end

    def set_after_all(platform, block)
      after_all_blocks[platform] = block
    end

    def set_error(platform, block)
      error_blocks[platform] = block
    end

    def lanes
      @lanes ||= {}
    end

    def before_each_blocks
      @before_each ||= {}
    end

    def after_each_blocks
      @after_each ||= {}
    end

    def before_all_blocks
      @before_all ||= {}
    end

    def after_all_blocks
      @after_all ||= {}
    end

    def error_blocks
      @error_blocks ||= {}
    end
  end
end
