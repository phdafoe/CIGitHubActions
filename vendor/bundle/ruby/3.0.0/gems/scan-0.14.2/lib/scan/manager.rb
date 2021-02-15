module Scan
  class Manager
    def work(options)
      Scan.config = options

      # Also print out the path to the used Xcode installation
      # We go 2 folders up, to not show "Contents/Developer/"
      values = Scan.config.values(ask: false)
      values[:xcode_path] = File.expand_path("../..", FastlaneCore::Helper.xcode_path)
      FastlaneCore::PrintTable.print_values(config: values,
                                         hide_keys: [:destination, :slack_url],
                                             title: "Summary for scan #{Scan::VERSION}")

      return Runner.new.run
    end
  end
end
