# frozen_string_literal: true

# Libraries
require 'faraday'
require 'faraday_middleware'
require 'active_support/all'
require 'zoho_api/version'

require File.expand_path('zoho_api/configuration', __dir__)
require File.expand_path('zoho_api/api', __dir__)
require File.expand_path('zoho_api/books/client', __dir__)
require File.expand_path('zoho_api/invoice/client', __dir__)
require File.expand_path('zoho_api/error', __dir__)
require File.expand_path('faraday/auth', __dir__)
require File.expand_path('faraday/raise_exception', __dir__)

# Configuration for ZohoApi
module ZohoApi
  extend Configuration
  # Alias for ZohoApi::Client.new
  # @return [ZohoApi::Client]
  def self.client(options = {})
    ZohoApi::Client.new(options)
  end

  # Delegate to ZohoApi::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)

    client.send(method, *args, &block)
  end
end
