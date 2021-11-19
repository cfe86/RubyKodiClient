# frozen_string_literal: true

module KodiClient
  module Types
    module Files
      # return value for GetSources
      class GetSourcesReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :sources, :limits

        type_mapping ['sources', Files::FileLabel, true], ['limits', List::ListLimitsReturned]

        def initialize(sources, limits)
          @sources = sources
          @limits = limits
        end
      end
    end
  end
end
