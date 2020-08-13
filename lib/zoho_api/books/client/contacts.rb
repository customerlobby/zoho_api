# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
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
