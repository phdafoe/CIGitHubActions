require 'commander'

HighLine.track_eof = false

module PEM
  class CommandsGenerator
    include Commander::Methods

    def self.start
      FastlaneCore::UpdateChecker.start_looking_for_update('pem')
      self.new.run
    ensure
      FastlaneCore::UpdateChecker.show_update_status('pem', PEM::VERSION)
    end

    def run
      program :version, PEM::VERSION
      program :description, 'CLI for \'PEM\' - Automatically generate and renew your push notification profiles'
      program :help, 'Author', 'Felix Krause <pem@krausefx.com>'
      program :help, 'Website', 'https://fastlane.tools'
      program :help, 'GitHub', 'https://github.com/fastlane/PEM'
      program :help_formatter, :compact

      global_option('--verbose') { $verbose = true }

      FastlaneCore::CommanderGenerator.new.generate(PEM::Options.available_options)

      command :renew do |c|
        c.syntax = 'pem renew'
        c.description = 'Renews the certificate (in case it expired) and shows the path to the generated pem file'

        c.action do |args, options|
          PEM.config = FastlaneCore::Configuration.create(PEM::Options.available_options, options.__hash__)
          PEM::Manager.start
        end
      end

      default_command :renew

      run!
    end
  end
end
