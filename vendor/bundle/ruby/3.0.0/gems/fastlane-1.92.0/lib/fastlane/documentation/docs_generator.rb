module Fastlane
  class DocsGenerator
    def self.run(ff, output_path = nil)
      output_path ||= File.join(Fastlane::FastlaneFolder.path || '.', 'README.md')

      output = ["fastlane documentation"]
      output << "================"

      output << "# Installation"
      output << "```"
      output << "sudo gem install fastlane"
      output << "```"

      output << "# Available Actions"

      all_keys = ff.runner.lanes.keys.reject(&:nil?)
      all_keys.unshift(nil) # because we want root elements on top. always! They have key nil

      all_keys.each do |platform|
        output << "## #{formatted_platform(platform)}" if platform

        value = ff.runner.lanes[platform]
        next unless value

        value.each do |lane_name, lane|
          next if lane.is_private
          output << render(platform, lane_name, lane.description.join("\n\n"))
        end

        output << ""
        output << "----"
        output << ""
      end

      output << "This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools)."
      output << "More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools)."
      output << "The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane)."

      File.write(output_path, output.join("\n"))
      UI.success "Successfully generated documentation to path '#{File.expand_path(output_path)}'" if $verbose
    end

    #####################################################
    # @!group Helper
    #####################################################

    def self.formatted_platform(pl)
      pl = pl.to_s
      return "iOS" if pl == 'ios'
      return "Mac" if pl == 'mac'
      return "Android" if pl == 'android'

      return pl
    end

    # @param platform [String]
    # @param lane [Fastlane::Lane]
    # @param description [String]
    def self.render(platform, lane, description)
      full_name = [platform, lane].reject(&:nil?).join(' ')

      output = []
      output << "### #{full_name}"
      output << "```"
      output << "fastlane #{full_name}"
      output << "```"
      output << description
      output
    end
  end
end
