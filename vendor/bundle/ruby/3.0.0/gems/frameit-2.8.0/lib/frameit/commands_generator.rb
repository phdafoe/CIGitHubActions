require 'commander'

HighLine.track_eof = false

module Frameit
  class CommandsGenerator
    include Commander::Methods

    def self.start
      FastlaneCore::UpdateChecker.start_looking_for_update('frameit')
      Frameit::DependencyChecker.check_dependencies
      self.new.run
    ensure
      FastlaneCore::UpdateChecker.show_update_status('frameit', Frameit::VERSION)
    end

    def run
      program :version, Frameit::VERSION
      program :description, 'Quickly put your screenshots into the right device frames'
      program :help, 'Author', 'Felix Krause <frameit@krausefx.com>'
      program :help, 'Website', 'https://fastlane.tools'
      program :help, 'GitHub', 'https://github.com/fastlane/frameit'
      program :help_formatter, :compact

      global_option('--verbose') { $verbose = true }
      FastlaneCore::CommanderGenerator.new.generate(Frameit::Options.available_options)

      default_command :run

      command :run do |c|
        c.syntax = 'frameit black'
        c.description = "Adds a black frame around all screenshots."

        c.action do |args, options|
          load_config(options)
          Frameit::Runner.new.run('.', nil)
        end
      end

      command :silver do |c|
        c.syntax = 'frameit silver'
        c.description = "Adds a silver frame around all screenshots."

        c.action do |args, options|
          load_config(options)
          Frameit::Runner.new.run('.', Frameit::Color::SILVER)
        end
      end

      command :setup do |c|
        c.syntax = 'frameit setup'
        c.description = "Helps you adding new frames."

        c.action do |args, options|
          Frameit::FrameConverter.new.run
        end
      end

      alias_command :white, :silver

      run!
    end

    private

    def load_config(options)
      o = options.__hash__.dup
      o.delete(:verbose)
      Frameit.config = FastlaneCore::Configuration.create(Frameit::Options.available_options, o)
    end
  end
end
