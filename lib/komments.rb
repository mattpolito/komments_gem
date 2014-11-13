require "komments/version"
require "komments/configuration"

module Komments
  def self.configure
    yield(configuration)
  end

  def self.website_url
    "//#{configuration.root_url}/embed/#{configuration.api_key}"
  end

  private

  def self.configuration
    Configuration.instance
  end
end
