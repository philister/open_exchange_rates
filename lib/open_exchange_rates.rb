require "rubygems"
require "open_exchange_rates/version"
require "open_exchange_rates/configuration"
require "open_exchange_rates/parser"
require "open_exchange_rates/response"
require "open_exchange_rates/rates"

module OpenExchangeRates
  BASE_URL = "http://openexchangerates.org"
  LATEST_URL = "#{BASE_URL}/latest.json"

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= OpenExchangeRates::Configuration.new
    yield(configuration)
  end
end

# Default configuration
OpenExchangeRates.configure do |config|
  config.app_id = ENV['OPEN_EXCHANGE_RATES_APP_ID']
end
