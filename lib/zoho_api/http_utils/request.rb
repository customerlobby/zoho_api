# frozen_string_literal: true

module ZohoApi
  class HttpUtils
    # Defines HTTP request methods
    module Request
      # Perform an HTTP GET request
      def get(path, options = {})
        request(:get, path, options)
      end

      # Perform an HTTP POST request
      def post(path, options = {})
        request(:post, path, options)
      end

      # Perform an HTTP PUT request
      def put(path, options = {})
        request(:put, path, options)
      end

      private

      # Perform an HTTP request
      def request(method, path, options)
        connection_method = if options.present? && options.delete(:request_token)
                              token_connection(options.delete(:params) || {})
                            else
                              connection
                            end
        http_response = connection_method.send(method) do |request|
          case method
          when :get
            formatted_options = format_options(options)
            request.url(path, formatted_options)
          when :post, :put
            request.headers['Content-Type'] = 'application/json'
            request.body = options.to_json unless options.empty?
            request.url(path)
          end
          request.options.timeout = 120 # read timeout
          request.options.open_timeout = 300 # connection timeout
        end

        data = Response.create(http_response.body)
        response = {}

        response['data'] = data
        response
      end

      # Format the Options before you send them off to ZohoApi
      def format_options(options)
        return if options.blank?

        opts = {}
        opts['page'] = options[:page] if options.key?(:page)
        opts['per_page'] = options[:per_page] if options.key?(:per_page)
        opts['sort_column'] = options[:sort_by] if options.key?(:sort_by)
        opts['organization_id'] = options[:organization_id] if options.key?(:organization_id)
        opts
      end
    end
  end
end
