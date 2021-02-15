module Spaceship
  module Tunes
    class PricingTier < TunesBase
      # @return (String) Number of the price Tier (e.g. "0" for Tier 0 aka Free)
      attr_accessor :tier_stem

      # @return (String) Name of the tier (e.g. "Free" for Tier 0)
      attr_accessor :tier_name

      # @return (Array of Spaceship::Tunes::PricingInfo objects) A list of all prices for the respective countries
      attr_accessor :pricing_info

      attr_mapping(
        'tierStem' => :tier_stem,
        'tierName' => :tier_name
      )

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          obj.unfold_pricing_info(attrs['pricingInfo'])

          return obj
        end
      end

      def unfold_pricing_info(attrs)
        unfolded_pricing_info = attrs.map { |info| PricingInfo.new(info) }
        instance_variable_set(:@pricing_info, unfolded_pricing_info)
      end
    end

    class PricingInfo < TunesBase
      # @return (String) name of the country, e.g. "United States"
      attr_accessor :country

      # @return (String) country code, e.g. "US"
      attr_accessor :country_code

      # @return (String) currency symbol, e.g. "$"
      attr_accessor :currency_symbol

      # @return (String) currency code, e.g. "USD"
      attr_accessor :currency_code

      # @return (Number) net proceedings for the developer
      attr_accessor :wholesale_price

      # @return (Number) customer price
      attr_accessor :retail_price

      # @return (String) formatted customer price, e.g. "$0.00"
      attr_accessor :f_retail_price

      # @return (String) formatted net proceedings, e.g. "$0.00"
      attr_accessor :f_wholesale_price

      attr_mapping(
        'country' => :country,
        'countryCode' => :country_code,
        'currencySymbol' => :currency_symbol,
        'currencyCode' => :currency_code,
        'wholesalePrice' => :wholesale_price,
        'retailPrice' => :retail_price,
        'fRetailPrice' => :f_retail_price,
        'fWholesalePrice' => :f_wholesale_price
      )

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
