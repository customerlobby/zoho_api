# frozen_string_literal: true

require File.expand_path('http_utils/request', __dir__)
require File.expand_path('http_utils/response', __dir__)
require File.expand_path('http_utils/connection', __dir__)
require File.expand_path('configuration', __dir__)

module ZohoApi
  # Apis used under Zoho
  class API
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = ZohoApi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def config
      conf = {}
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send(key)
      end
      conf
    end

    include ZohoApi::HttpUtils::Request
    include ZohoApi::HttpUtils::Response
    include ZohoApi::HttpUtils::Connection
  end
end
