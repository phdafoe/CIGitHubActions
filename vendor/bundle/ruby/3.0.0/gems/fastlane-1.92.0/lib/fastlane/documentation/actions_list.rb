module Fastlane
  class ActionsList
    def self.run(filter: nil, platform: nil)
      require 'terminal-table'
      if filter
        show_details(filter: filter)
      else
        print_all(platform: platform)
      end
    end

    def self.print_all(platform: nil)
      rows = []
      all_actions(platform) do |action, name|
        current = []
        current << name.yellow

        if action < Action
          current << action.description if action.description

          authors = Array(action.author || action.authors)
          current << authors.first.green if authors.count == 1
          current << "Multiple".green if authors.count > 1
        else
          UI.error action_subclass_error(name)
          current << "Please update action file".red
          current << ' '
        end
        rows << current
      end

      puts Terminal::Table.new(
        title: "Available fastlane actions".green,
        headings: ['Action', 'Description', 'Author'],
        rows: rows
      )
      puts "  Platform filter: #{platform}".magenta if platform
      puts "  Total of #{rows.count} actions"

      puts "\nGet more information for one specific action using `fastlane action [name]`\n".green
    end

    def self.show_details(filter: nil)
      puts "Loading documentation for #{filter}:".green
      puts ""

      action = find_action_named(filter)

      if action
        unless action < Action
          UI.user_error! action_subclass_error(filter)
        end

        print_summary(action, filter)
        print_options(action, filter)
        print_output_variables(action, filter)
        print_return_value(action, filter)

        puts "More information can be found on https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Actions.md"
        puts ""
      else
        puts "Couldn't find action for the given filter.".red
        puts "==========================================\n".red
        print_all # show all available actions instead
      end
    end

    def self.action_subclass_error(name)
      "Please update your action '#{name}' to be a subclass of `Action` by adding ` < Action` after your class name."
    end

    def self.print_summary(action, name)
      rows = []

      if action.description
        rows << [action.description]
        rows << [' ']
      end

      if action.details
        rows << [action.details]
        rows << [' ']
      end

      authors = Array(action.author || action.authors)
      rows << ["Created by #{authors.join(', ').green}"] unless authors.empty?

      puts Terminal::Table.new(title: name.green, rows: rows)
      puts ""
    end

    def self.print_options(action, name)
      options = parse_options(action.available_options) if action.available_options

      if options
        puts Terminal::Table.new(
          title: "#{name} Options".green,
          headings: ['Key', 'Description', 'Env Var', 'Default'],
          rows: options
        )
      else
        puts "No available options".yellow
      end
      puts ""
    end

    def self.print_output_variables(action, name)
      output = action.output
      return if output.nil? || output.empty?

      puts Terminal::Table.new(
        title: "#{name} Output Variables".green,
        headings: ['Key', 'Description'],
        rows: output.map { |key, desc| [key.yellow, desc] }
      )
      puts "Access the output values using `lane_context[SharedValues::VARIABLE_NAME]`"
      puts ""
    end

    def self.print_return_value(action, name)
      return unless action.return_value

      puts Terminal::Table.new(title: "#{name} Return Value".green, rows: [[action.return_value]])
      puts ""
    end

    # Iterates through all available actions and yields from there
    def self.all_actions(platform = nil)
      action_symbols = Fastlane::Actions.constants.select {|c| Fastlane::Actions.const_get(c).kind_of? Class }
      action_symbols.sort.each do |symbol|
        action = Fastlane::Actions.const_get(symbol)

        # We allow classes that don't respond to is_supported? to come through because we want to list
        # them as broken actions in the table, regardless of platform specification
        next if platform && action.respond_to?(:is_supported?) && !action.is_supported?(platform.to_sym)

        name = symbol.to_s.gsub('Action', '').fastlane_underscore
        yield action, name
      end
    end

    def self.find_action_named(name)
      all_actions do |action, action_name|
        return action if action_name == name
      end

      nil
    end

    # Helper:
    def self.parse_options(options, fill_all = true)
      rows = []
      rows << [options] if options.kind_of? String

      if options.kind_of? Array
        options.each do |current|
          if current.kind_of? FastlaneCore::ConfigItem
            rows << [current.key.to_s.yellow, current.description, current.env_name, current.default_value]
          elsif current.kind_of? Array
            # Legacy actions that don't use the new config manager
            UI.user_error!("Invalid number of elements in this row: #{current}. Must be 2 or 3") unless [2, 3].include? current.count
            rows << current
            rows.last[0] = rows.last.first.yellow # color it yellow :)
            rows.last << nil while fill_all and rows.last.count < 3 # to have a nice border in the table
          end
        end
      end

      rows
    end
  end
end
