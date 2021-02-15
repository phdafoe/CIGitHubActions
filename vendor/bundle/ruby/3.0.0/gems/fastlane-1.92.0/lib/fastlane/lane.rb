module Fastlane
  # Represents a lane
  class Lane
    attr_accessor :platform

    attr_accessor :name

    # @return [Array] An array containing the description of this lane
    #   Each item of the array is one line
    attr_accessor :description

    attr_accessor :block

    # @return [Boolean] Is that a private lane that can't be called from the CLI?
    attr_accessor :is_private

    def initialize(platform: nil, name: nil, description: nil, block: nil, is_private: false)
      UI.user_error!("description must be an array") unless description.kind_of? Array
      UI.user_error!("lane name must not contain any spaces") if name.to_s.include? " "
      UI.user_error!("lane name must start with :") unless name.kind_of? Symbol

      self.class.verify_lane_name(name)

      self.platform = platform
      self.name = name
      self.description = description
      self.block = block
      self.is_private = is_private
    end

    # Execute this lane
    def call(parameters)
      block.call(parameters || {})
    end

    # @return [String] The lane + name of the lane. If there is no platform, it will only be the lane name
    def pretty_name
      [platform, name].reject(&:nil?).join(' ')
    end

    class << self
      # Makes sure the lane name is valid
      def verify_lane_name(name)
        if self.black_list.include?(name.to_s)
          UI.error "Lane Name '#{name}' can not be one of the followings: #{self.black_list}"
          UI.user_error!("Name '#{name}' is already taken")
        end

        if self.gray_list.include?(name.to_sym)
          UI.error "Lane name '#{name}' should not be used because it is the name of a fastlane tool"
          UI.error "It is recommended to not use '#{name}' as the name of your lane"
          # We still allow it, because we're nice
          # Otherwise we might break existing setups
        end
      end

      def black_list
        %w(run init new_action lanes list docs action actions help)
      end

      def gray_list
        Fastlane::TOOLS
      end
    end
  end
end
