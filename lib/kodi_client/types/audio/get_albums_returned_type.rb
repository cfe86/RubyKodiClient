# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # return type for AudioLibrary.GetAlbums
      class GetAlbumsReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :albums, :limits

        type_mapping ['albums', DetailsAlbum, true], ['limits', List::ListLimitsReturned]

        def initialize(albums, limits)
          @albums = albums
          @limits = limits
        end
      end
    end
  end
end
