# frozen_string_literal: true

module KodiClient
  module Types
    module Files
      # return value for GetDirectory
      class GetDirectoryReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :files, :limits

        type_mapping ['files', List::ListItemFile, true], ['limits', List::ListLimitsReturned]

        def initialize(files, limits)
          @files = files
          @limits = limits
        end
      end
    end
  end
end
