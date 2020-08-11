# frozen_string_literal: true

module ZohoApi
  # Wrapper for the ZohoApi REST API.
  class Client < ZohoApi::API
    Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }
    Dir[File.expand_path('client/*/*.rb', __dir__)].each { |f| require f }

    include ZohoApi::Client::Token

    def initialize(options = {})
      mod_name = options.fetch(:module, nil)
      env = options.fetch(:environment, :live)
      unless Configuration::VALID_MODULES.include?(mod_name)
        raise 'Undefined module name'
      end

      load_modules(mod_name)
      super options.merge(endpoint: module_endpoint[mod_name][env])
    end

    def module_endpoint
      {
        invoices: {
          live: 'invoices.zoho.com',
          sandbox: 'invoices-test.zoho.com'
        },
        books: {
          live: 'books.zoho.com',
          sandbox: 'books-test.zoho.com'
        }
      }.with_indifferent_access
    end

    def load_modules(mod)
      if mod.to_sym == :invoices
        extend ZohoApi::Client::Invoicing::Contacts
        extend ZohoApi::Client::Invoicing::Invoices
      elsif mod.to_sym == :books
        extend ZohoApi::Client::Books::Contacts
        extend ZohoApi::Client::Books::Invoices
      end
    end
  end
end
