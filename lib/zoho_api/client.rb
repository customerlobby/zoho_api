# frozen_string_literal: true

module ZohoApi
  # Wrapper for the ZohoApi REST API.
  class Client < ZohoApi::API
    Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }
    Dir[File.expand_path('client/*/*.rb', __dir__)].each { |f| require f }

    include ZohoApi::Client::Token
    include ZohoApi::Client::Invoicing::Contacts
    include ZohoApi::Client::Invoicing::Invoices
    include ZohoApi::Client::Books::Contacts
    include ZohoApi::Client::Books::Invoices
  end
end
