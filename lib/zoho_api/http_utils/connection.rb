# frozen_string_literal: true

require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __dir__)].each { |f| require f }

module ZohoApi
  class HttpUtils
    # Module for ZohoApi connections
    module Connection
      private

      def connection
        options = { url: "https://#{endpoint}#{api_version}/" }

        Faraday::Connection.new(options) do |connection|
          unless access_token
            raise(ZohoApi::AuthorizationError, 'invalid access token')
          end

          connection.use FaradayMiddleware::ZohoApiOAuth, access_token
          connection.use FaradayMiddleware::RaiseException
          connection.use FaradayMiddleware::Mashify
          connection.use Faraday::Response::ParseJson
          connection.adapter(adapter)
        end
      end

      def token_connection(params = {})
        errors = []
        %i[client_id client_secret redirect_uri].each do |attr|
          errors << "#{attr} is not present" unless send(attr).present?
        end
        raise ZohoApi::ConnectionError, errors.join(', ') if errors.present?

        Faraday::Connection.new(url: ZohoApi::Configuration::TOKEN_URL) do |connection|
          connection.use FaradayMiddleware::RaiseException
          connection.use FaradayMiddleware::Mashify
          connection.use Faraday::Response::ParseJson
          connection.adapter(adapter)

          connection.params = params
        end
      end
    end
  end
end
