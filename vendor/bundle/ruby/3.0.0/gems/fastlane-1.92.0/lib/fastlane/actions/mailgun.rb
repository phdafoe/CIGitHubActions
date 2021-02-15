require 'fastlane/erb_template_helper'

module Fastlane
  module Actions
    class MailgunAction < Action

      def self.is_supported?(platform)
        true
      end

      def self.run(options)
        Actions.verify_gem!('rest-client')
        require 'rest-client'
        handle_params_transition(options)
        mailgunit(options)
      end

      def self.description
        "Send a success/error message to an email group"
      end

      def self.available_options
        [
          # This is here just for while due to the transition, not needed anymore
          FastlaneCore::ConfigItem.new(key: :mailgun_sandbox_domain,
                                       env_name: "MAILGUN_SANDBOX_POSTMASTER",
                                       optional: true,
                                       description: "Mailgun sandbox domain postmaster for your mail. Please use postmaster instead"),
          # This is here just for while due to the transition, should use postmaster instead
          FastlaneCore::ConfigItem.new(key: :mailgun_sandbox_postmaster,
                                       env_name: "MAILGUN_SANDBOX_POSTMASTER",
                                       optional: true,
                                       description: "Mailgun sandbox domain postmaster for your mail. Please use postmaster instead"),
          # This is here just for while due to the transition, should use apikey instead
          FastlaneCore::ConfigItem.new(key: :mailgun_apikey,
                                       env_name: "MAILGUN_APIKEY",
                                       optional: true,
                                       description: "Mailgun apikey for your mail. Please use postmaster instead"),

          FastlaneCore::ConfigItem.new(key: :postmaster,
                                       env_name: "MAILGUN_SANDBOX_POSTMASTER",
                                       description: "Mailgun sandbox domain postmaster for your mail"),
          FastlaneCore::ConfigItem.new(key: :apikey,
                                       env_name: "MAILGUN_APIKEY",
                                       description: "Mailgun apikey for your mail"),
          FastlaneCore::ConfigItem.new(key: :to,
                                       env_name: "MAILGUN_TO",
                                       description: "Destination of your mail"),
          FastlaneCore::ConfigItem.new(key: :from,
                                       env_name: "MAILGUN_FROM",
                                       optional: true,
                                       description: "Mailgun sender name",
                                       default_value: "Mailgun Sandbox"),
          FastlaneCore::ConfigItem.new(key: :message,
                                       env_name: "MAILGUN_MESSAGE",
                                       description: "Message of your mail"),
          FastlaneCore::ConfigItem.new(key: :subject,
                                       env_name: "MAILGUN_SUBJECT",
                                       description: "Subject of your mail",
                                       optional: true,
                                       is_string: true,
                                       default_value: "fastlane build"),
          FastlaneCore::ConfigItem.new(key: :success,
                                      env_name: "MAILGUN_SUCCESS",
                                      description: "Was this build successful? (true/false)",
                                      optional: true,
                                      default_value: true,
                                      is_string: false),
          FastlaneCore::ConfigItem.new(key: :app_link,
                                      env_name: "MAILGUN_APP_LINK",
                                      description: "App Release link",
                                      optional: false,
                                      is_string: true),
          FastlaneCore::ConfigItem.new(key: :ci_build_link,
                                      env_name: "MAILGUN_CI_BUILD_LINK",
                                      description: "CI Build Link",
                                      optional: true,
                                      is_string: true),
          FastlaneCore::ConfigItem.new(key: :template_path,
                                      env_name: "MAILGUN_TEMPLATE_PATH",
                                      description: "Mail HTML template",
                                      optional: true,
                                      is_string: true)

        ]
      end

      def self.author
        "thiagolioy"
      end

      def self.handle_params_transition(options)
        options[:postmaster] = options[:mailgun_sandbox_postmaster] if options[:mailgun_sandbox_postmaster]
        puts "\nUsing :mailgun_sandbox_postmaster is deprecated, please change to :postmaster".yellow if options[:mailgun_sandbox_postmaster]

        options[:apikey] = options[:mailgun_apikey] if options[:mailgun_apikey]
        puts "\nUsing :mailgun_apikey is deprecated, please change to :apikey".yellow if options[:mailgun_apikey]
      end

      def self.mailgunit(options)
        sandbox_domain = options[:postmaster].split("@").last
        RestClient.post "https://api:#{options[:apikey]}@api.mailgun.net/v3/#{sandbox_domain}/messages",
                        from: "#{options[:from]}<#{options[:postmaster]}>",
                        to: (options[:to]).to_s,
                        subject: options[:subject],
                        html: mail_template(options)
        mail_template(options)
      end

      def self.mail_template(options)
        hash = {
          author: Actions.git_author_email,
          last_commit: Actions.last_git_commit_message,
          message: options[:message],
          app_link: options[:app_link]
        }
        hash[:success] = options[:success]
        hash[:ci_build_link] = options[:ci_build_link]

        # grabs module
        eth = Fastlane::ErbTemplateHelper

        # create html from template
        html_template_path = options[:template_path]
        if html_template_path && File.exist?(html_template_path)
          html_template = eth.load_from_path(html_template_path)
        else
          html_template = eth.load("mailgun_html_template")
        end
        eth.render(html_template, hash)
      end

    end
  end
end
