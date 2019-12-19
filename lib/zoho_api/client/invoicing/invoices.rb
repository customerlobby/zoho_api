# frozen_string_literal: true

module ZohoApi
  class Client
    module Invoicing
      # Api wrapper for invoicing invoices apis
      module Invoices
        def invoices(params = {})
          get('invoices', params)
        end

        def invoice(uuid, params = {})
          get("invoices/#{uuid}", params)['invoice']
        end
      end
    end
  end
end