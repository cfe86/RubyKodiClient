# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # return type for AudioLibrary.GetAlbums
      class GetArtistsReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :artists, :limits

        type_mapping ['artists', AudioDetailsArtist, true], ['limits', List::ListLimitsReturned]

        def initialize(artists, limits)
          @artists = artists
          @limits = limits
        end
      end
    end
  end
end

