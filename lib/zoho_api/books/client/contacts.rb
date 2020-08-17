# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
      # Api wrapper for invoicing contacts apis
      module Contacts
        def contacts(params = {})
          validate(params, :organization_id)
          get('contacts', params)
        end

        def contact(uuid, params = {})
          validate(params, :organization_id)
          get("contacts/#{uuid}", params)['data']
        end

        def validate(params = {}, *args)
          args.each do |field|
            raise ZohoApi::BadRequestError, "#{field} is missing in request"
          end
        end
      end
    end
  end
end
