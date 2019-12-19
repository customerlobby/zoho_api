# frozen_string_literal: true

module FaradayMiddleware
  # Authentication for Zoho Apis
  class ZohoApiOAuth < Faraday::Middleware
    def initialize(app, access_token)
      @app          = app
      @access_token = access_token
    end

    def call(env)
      env[:request_headers]
        .merge!('Authorization' => "Zoho-oauthtoken #{@access_token}")
      @app.call env
    end
  end
end
