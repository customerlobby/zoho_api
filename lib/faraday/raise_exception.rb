# frozen_string_literal: true

require 'nokogiri'

module FaradayMiddleware
  # Class to handle exceptions
  class RaiseException < Faraday::Middleware
    def initialize(app)
      super(app)
    end

    def call(env)
      begin
        response = @app.call(env)
        if response.status == 401
          raise ZohoApi::AuthorizationError, response.body.message
        end
      rescue Faraday::Error::ConnectionFailed, Faraday::TimeoutError => e
        raise ZohoApi::ConnectionError, e
      end

      response
    end
  end
end
