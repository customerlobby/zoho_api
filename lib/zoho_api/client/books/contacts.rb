# frozen_string_literal: true

module ZohoApi
  class Client
    module Books
      # Api wrapper for invoicing contacts apis
      module Contacts
        def contacts(params = {})
          get('contacts', params)
        end

        def contact(uuid, params = {})
          get("contacts/#{uuid}", params)['data']
        end
      end
    end
  end
end
