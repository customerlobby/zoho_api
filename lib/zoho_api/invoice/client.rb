# frozen_string_literal: true

module ZohoApi
  module Invoice
    # Wrapper for the ZohoApi REST API.
    class Client < ZohoApi::API
      Dir[File.expand_path('../client/*.rb', __dir__)].each { |f| require f }
      Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }

      include ZohoApi::Client::Token
      include ZohoApi::Invoice::Client::Contacts
      include ZohoApi::Invoice::Client::Invoices

      def initialize(options = {})
        super(options.merge config(options))
      end

      def module_endpoint(sandbox)
        sandbox ? 'invoice-test.zoho.com' : 'invoice.zoho.com'
      end

      def config(options = {})
        {
          endpoint: module_endpoint(options.fetch(:sandbox, false))
        }
      end
    end
  end
end
