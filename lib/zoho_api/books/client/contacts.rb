# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
      # Api wrapper for invoicing contacts apis
      module Contacts
        def contacts(params = {})
          validate :organization_id
          get 'contacts', params.merge(organization_id: organization_id)
        end

        def contact(uuid, params = {})
          validate :organization_id
          get("contacts/#{uuid}", params.merge(organization_id: organization_id))['data']
        end

        def validate(*args)
          args.each do |field|
            raise ZohoApi::BadRequestError, "#{field} is missing in request" unless send(field)
          end
        end
      end
    end
  end
end
