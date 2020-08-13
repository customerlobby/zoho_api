# frozen_string_literal: true

module ZohoApi
  class Version
    MAJOR = 0 unless defined? ZohoApi::Version::MAJOR
    MINOR = 2 unless defined? ZohoApi::Version::MINOR
    PATCH = 0 unless defined? ZohoApi::Version::PATCH

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
