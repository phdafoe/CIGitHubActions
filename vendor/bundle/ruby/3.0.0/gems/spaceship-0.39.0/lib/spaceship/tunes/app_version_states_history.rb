module Spaceship
  module Tunes
    # Represents a read only version of an iTunes Connect Versions State History
    class AppVersionStatesHistory < TunesBase
      # @return (String) the state
      attr_reader :state_key

      # @return (String) The name of the user who made the change
      attr_reader :user_name

      # @return (String) the email of the user or nil
      attr_reader :user_email

      # @return (Integer) the date of the state
      attr_reader :date

      attr_mapping({
        'stateKey' => :state_key,
        'userName' => :user_name,
        'userEmail' => :user_email,
        'date' => :date
      })

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          return obj
        end
      end
    end
  end
end
