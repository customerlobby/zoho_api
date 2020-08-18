# frozen_string_literal: true

module ZohoApi
  module Books
    # Wrapper for the ZohoApi REST API.
    class Client < ZohoApi::API
      Dir[File.expand_path('../client/*.rb', __dir__)].each { |f| require f }
      Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }

      include ZohoApi::Client::Token
      include ZohoApi::Books::Client::Contacts
      include ZohoApi::Books::Client::Invoices
      include ZohoApi::Books::Client::Organization

      def initialize(options = {})
        super(options.merge config(options))
      end

      def module_endpoint(sandbox)
        sandbox ? 'books-test.zoho.com' : 'books.zoho.com'
      end

      def config(options = {})
        {
          endpoint: module_endpoint(options.fetch(:sandbox, false))
        }
      end
    end
  end
end
