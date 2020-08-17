# frozen_string_literal: true

module ZohoApi
  module Books
    class Client
      # Api wrapper for invoicing invoices apis
      module Invoices
        def invoices(params = {})
          validate(params, :organization_id)
          get('invoices', params)
        end

        def invoice(uuid, params = {})
          validate(params, :organization_id)
          get("invoices/#{uuid}", params)['data']
        end

        def validate(params = {}, *args)
          args.each do |field|
            raise ZohoApi::BadRequestError, "#{field} is missing in request" unless params[field]
          end
        end
      end
    end
  end
end
