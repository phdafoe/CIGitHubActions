module Fastlane
  module Actions
    module SharedValues
      GET_GITHUB_RELEASE_INFO = :GET_GITHUB_RELEASE_INFO
    end

    class GetGithubReleaseAction < Action
      def self.run(params)
        UI.message("Getting release on GitHub (#{params[:server_url]}/#{params[:url]}: #{params[:version]})")
        require 'excon'
        require 'base64'

        server_url = params[:server_url]
        server_url = server_url[0..-2] if server_url.end_with? '/'

        headers = { 'User-Agent' => 'fastlane-get_github_release' }
        headers['Authorization'] = "Basic #{Base64.strict_encode64(params[:api_token])}" if params[:api_token]

        # To still get the data when a repo has been moved
        middlewares = Excon.defaults[:middlewares] + [Excon::Middleware::RedirectFollower]
        response = Excon.get("#{server_url}/repos/#{params[:url]}/releases", headers: headers, middlewares: middlewares)

        case response[:status]
        when 404
          UI.error("Repository #{params[:url]} cannot be found, please double check its name and that you provided a valid API token (if it's a private repository).")
          return nil
        when 401
          UI.error("You are not authorized to access #{params[:url]}, please make sure you provided a valid API token.")
          return nil
        else
          if response[:status] != 200
            UI.error("GitHub responded with #{response[:status]}:#{response[:body]}")
            return nil
          end
        end

        result = JSON.parse(response.body)
        result.each do |current|
          next unless current['tag_name'] == params[:version]

          # Found it
          Actions.lane_context[SharedValues::GET_GITHUB_RELEASE_INFO] = current
          UI.message("Version is already live on GitHub.com 🚁")
          return current
        end

        UI.important("Couldn't find GitHub release #{params[:version]}")
        return nil
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "This will verify if a given release version is available on GitHub"
      end

      def self.details
        sample = '
              {"url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713",
                 "assets_url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713/assets",
                 "upload_url"=>"https://uploads.github.com/repos/KrauseFx/fastlane/releases/1537713/assets{?name}",
                 "html_url"=>"https://github.com/fastlane/fastlane/releases/tag/1.8.0",
                 "id"=>1537713,
                 "tag_name"=>"1.8.0",
                 "target_commitish"=>"master",
                 "name"=>"1.8.0 Switch Lanes & Pass Parameters",
                 "draft"=>false,
                 "author"=>
                  {"login"=>"KrauseFx",
                   "id"=>869950,
                   "avatar_url"=>"https://avatars.githubusercontent.com/u/869950?v=3",
                   "gravatar_id"=>"",
                   "url"=>"https://api.github.com/users/KrauseFx",
                   "html_url"=>"https://github.com/fastlane",
                   "followers_url"=>"https://api.github.com/users/KrauseFx/followers",
                   "following_url"=>"https://api.github.com/users/KrauseFx/following{/other_user}",
                   "gists_url"=>"https://api.github.com/users/KrauseFx/gists{/gist_id}",
                   "starred_url"=>"https://api.github.com/users/KrauseFx/starred{/owner}{/repo}",
                   "subscriptions_url"=>"https://api.github.com/users/KrauseFx/subscriptions",
                   "organizations_url"=>"https://api.github.com/users/KrauseFx/orgs",
                   "repos_url"=>"https://api.github.com/users/KrauseFx/repos",
                   "events_url"=>"https://api.github.com/users/KrauseFx/events{/privacy}",
                   "received_events_url"=>"https://api.github.com/users/KrauseFx/received_events",
                   "type"=>"User",
                   "site_admin"=>false},
                 "prerelease"=>false,
                 "created_at"=>"2015-07-14T23:33:01Z",
                 "published_at"=>"2015-07-14T23:44:10Z",
                 "assets"=>[],
                 "tarball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/tarball/1.8.0",
                 "zipball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/zipball/1.8.0",
                 "body"=> ...Markdown...
                "This is one of the biggest updates of `fastlane` yet"
              }'

        [
          "This will return all information about a release. For example:",
          sample
        ].join("\n")
      end

      def self.output
        [
          ['GET_GITHUB_RELEASE_INFO', 'Contains all the information about this release']
        ]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                                       env_name: "FL_GET_GITHUB_RELEASE_URL",
                                       description: "The path to your repo, e.g. 'KrauseFx/fastlane'",
                                       verify_block: proc do |value|
                                         UI.user_error!("Please only pass the path, e.g. 'KrauseFx/fastlane'") if value.include? "github.com"
                                         UI.user_error!("Please only pass the path, e.g. 'KrauseFx/fastlane'") if value.split('/').count != 2
                                       end),
          FastlaneCore::ConfigItem.new(key: :server_url,
                                       env_name: "FL_GITHUB_RELEASE_SERVER_URL",
                                       description: "The server url. e.g. 'https://your.github.server/api/v3' (Default: 'https://api.github.com')",
                                       default_value: "https://api.github.com",
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Please include the protocol in the server url, e.g. https://your.github.server") unless value.include? "//"
                                       end),
          FastlaneCore::ConfigItem.new(key: :version,
                                       env_name: "FL_GET_GITHUB_RELEASE_VERSION",
                                       description: "The version tag of the release to check"),
          FastlaneCore::ConfigItem.new(key: :api_token,
                             env_name: "FL_GITHUB_RELEASE_API_TOKEN",
                             description: "GitHub Personal Token (required for private repositories)",
                             optional: true)
        ]
      end

      def self.authors
        ["KrauseFx", "czechboy0", "jaleksynas"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
