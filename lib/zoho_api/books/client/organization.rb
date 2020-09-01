# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
      # Api wrapper for invoicing contacts apis
      module Organization
        def organizations(params = {})
          get('organizations', params)
        end

        def organization(uuid, params = {})
          get("organizations/#{uuid}", params)['data']
        end
      end
    end
  end
end
