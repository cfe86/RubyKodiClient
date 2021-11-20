# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Property.Value
      class PropertyValue
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :albums_last_added, :albums_modified, :artist_links_updated, :artists_last_added,
                    :artists_modified, :genres_last_added, :library_last_cleaned, :library_last_updated,
                    :missing_artist_id, :songs_last_added, :songs_modified

        def initialize(albums_last_added, albums_modified, artist_links_updated, artists_last_added, artists_modified,
                       genres_last_added, library_last_cleaned, library_last_updated, missing_artist_id,
                       songs_last_added, songs_modified)
          @albums_last_added = albums_last_added
          @albums_modified = albums_modified
          @artist_links_updated = artist_links_updated
          @artists_last_added = artists_last_added
          @artists_modified = artists_modified
          @genres_last_added = genres_last_added
          @library_last_cleaned = library_last_cleaned
          @library_last_updated = library_last_updated
          @missing_artist_id = missing_artist_id
          @songs_last_added = songs_last_added
          @songs_modified = songs_modified
        end
      end
    end
  end
end
