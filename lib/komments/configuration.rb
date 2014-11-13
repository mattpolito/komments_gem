require 'singleton'
require 'kommnets/errors'

module Komments
  class Configuration
    include Singleton

    attr_writer :api_key

    def api_key
      raise Errors::KommentsAPIKeyNotProvided.new('Check that your API key is set') unless @api_key
      @api_key
    end

    def root_url
      "komments.net"
    end
  end
end
