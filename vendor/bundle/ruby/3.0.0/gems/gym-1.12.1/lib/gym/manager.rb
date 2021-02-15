module Gym
  class Manager
    def work(options)
      Gym.config = options

      # Also print out the path to the used Xcode installation
      # We go 2 folders up, to not show "Contents/Developer/"
      values = Gym.config.values(ask: false)
      values[:xcode_path] = File.expand_path("../..", FastlaneCore::Helper.xcode_path)
      FastlaneCore::PrintTable.print_values(config: values,
                                         hide_keys: [],
                                             title: "Summary for gym #{Gym::VERSION}")

      return Runner.new.run
    end
  end
end
