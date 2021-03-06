# frozen_string_literal: true

module ZohoApi
  module Invoice
    class Client
      # Api wrapper for invoicing invoices apis
      module Invoices
        def invoices(params = {})
          get('invoices', params)
        end

        def invoice(uuid, params = {})
          get("invoices/#{uuid}", params)['data']
        end
      end
    end
  end
end
