# frozen_string_literal: true

module ZohoApi
  class HttpUtils
    # Module for ZohoApi responses
    module Response
      def self.create(response_hash)
        data = begin
                 response_hash.data.dup
               rescue StandardError
                 response_hash
               end
        data.extend(self)
        if data.respond_to?(:error)
          raise ZohoApi::AuthorizationError, data.error
        end

        data
      end
    end
  end
end
