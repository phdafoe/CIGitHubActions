module Spaceship
  module Tunes
    # Represents the information about the generation of promocodes
    class AppVersionGeneratedPromocodes < TunesBase
      # @return
      attr_reader :effective_date
      attr_reader :expiration_date
      attr_reader :username
      # the AppVersionPromocodes this relates to
      attr_reader :version
      # Array of String
      attr_reader :codes

      attr_mapping({
        'effectiveDate' => :effective_date,
        'expirationDate' => :expiration_date,
        'username' => :username
      })

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          return obj
        end
      end

      def setup
        @version = Tunes::AppVersionPromocodes.factory(raw_data['version'])
        @codes = raw_data['codes']
      end
    end
  end
end
