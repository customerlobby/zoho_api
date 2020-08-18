# frozen_string_literal: true

module ZohoApi
  # Configuration for ZohoApi
  module Configuration
    VALID_OPTIONS_KEYS = %i[
      client_id
      client_secret
      redirect_uri
      auth_code
      access_token
      refresh_token
      api_version
      adapter
      endpoint
      sandbox
      organization_id
    ].freeze

    # By default don't set the access token.
    DEFAULT_ACCESS_TOKEN = nil

    # By default don't set the refresh token.
    DEFAULT_REFRESH_TOKEN = nil

    # By default use V3 of the API.
    DEFAULT_API_VERSION = '/api/v3'

    # Use the default Faraday adapter.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default use the main api URL.
    DEFAULT_ENDPOINT = 'invoice.zoho.com'

    TOKEN_URL = 'https://accounts.zoho.com'

    attr_accessor(*VALID_OPTIONS_KEYS)

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # When this module is extended, reset all settings.
    def self.extended(base)
      base.reset
    end

    # Reset all configuration settings to default values.
    def reset
      self.access_token = DEFAULT_ACCESS_TOKEN
      self.refresh_token = DEFAULT_REFRESH_TOKEN
      self.api_version = DEFAULT_API_VERSION
      self.endpoint = DEFAULT_ENDPOINT
      self.adapter = DEFAULT_ADAPTER
      self.sandbox = false
    end
  end
end
