# frozen_string_literal: true

module ZohoApi
  class Version
    MAJOR = 0 unless defined? ZohoApi::Version::MAJOR
    MINOR = 2 unless defined? ZohoApi::Version::MINOR
    PATCH = 3 unless defined? ZohoApi::Version::PATCH

    class << self
      # @return [String]
      def to_s
        File.exist?(filename) ? from_file : from_version      
      end
      
      def from_file
        File.open(filename).read        
      end  
      
      def from_version
        [MAJOR, MINOR, PATCH].compact.join('.')
      end  
      
      def filepath
        File.expand_path('zoho_api/VERSION', __dir__)
      end
      
      def filename
        'VERSION'
      end    
    end
  end
end
