# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # return type for AudioLibrary.GetGenres
      class GetGenresReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :genres, :limits

        type_mapping ['genres', Library::LibraryDetailsGenre, true], ['limits', List::ListLimitsReturned]

        def initialize(genres, limits)
          @genres = genres
          @limits = limits
        end
      end
    end
  end
end


