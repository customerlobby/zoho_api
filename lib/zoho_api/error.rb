# frozen_string_literal: true

# Module list default api errors
module ZohoApi
  class Error < StandardError; end
  class ConnectionError < Error; end
  class AuthorizationError < Error; end
  class BadRequestError < Error; end
  class RecordNotFoundError < Error; end
end
