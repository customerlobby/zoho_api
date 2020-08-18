# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
      # Api wrapper for invoicing invoices apis
      module Invoices
        def invoices(params = {})
          validate :organization_id
          get 'invoices', params.merge(organization_id: organization_id)
        end

        def invoice(uuid, params = {})
          validate :organization_id
          get("invoices/#{uuid}", params.merge(organization_id: organization_id))['data']
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
