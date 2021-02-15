module Fastlane
  # Call actions without triggering a full lane
  class OneOff
    def self.execute(args: nil)
      action_parameters = {}
      action_name = nil

      args.each do |current|
        if current.include? ":" # that's a key/value which we want to pass to the lane
          key, value = current.split(":", 2)
          UI.user_error!("Please pass values like this: key:value") unless key.length > 0
          value = CommandLineHandler.convert_value(value)
          UI.verbose("Using #{key}: #{value}")
          action_parameters[key.to_sym] = value
        else
          action_name ||= current
        end
      end

      UI.crash!("invalid syntax") unless action_name

      run(action: action_name,
          parameters: action_parameters)
    end

    def self.run(action: nil, parameters: nil)
      class_name = action.fastlane_class + 'Action'
      class_ref = nil
      begin
        class_ref = Fastlane::Actions.const_get(class_name)
      rescue NameError
        UI.user_error!("Action '#{action}' not available, run `fastlane actions` to get a full list")
      end

      r = Runner.new
      r.execute_action(action, class_ref, [parameters], custom_dir: '.')
    end
  end
end
