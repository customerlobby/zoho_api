# frozen_string_literal: true

module ZohoApi
  class Client
    # Api wrapper for token related apis
    module Token
      def renew_token
        validate :refresh_token

        response = post('oauth/v2/token',
                        request_token: true,
                        params: {
                          refresh_token: refresh_token,
                          grant_type: 'refresh_token'
                        }.merge(default_options))

        self.access_token = response['data'].access_token

        response['data']
      end

      def fetch_tokens
        validate :auth_code

        response = post('oauth/v2/token',
                        request_token: true,
                        params: {
                          code: auth_code,
                          grant_type: 'authorization_code'
                        }.merge(default_options))

        self.access_token = response['data'].access_token
        self.refresh_token = response['data'].refresh_token

        response['data']
      end

      private

      def default_options
        {
          client_id: client_id,
          client_secret: client_secret,
          redirect_uri: redirect_uri
        }
      end

      def validate(arg)
        return if send(arg).present?

        raise ZohoApi::ConnectionError, "#{arg} is not present"
      end
    end
  end
end
