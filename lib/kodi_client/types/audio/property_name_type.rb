# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Property.Name
      module PropertyName
        extend Extensions::Iterable

        MISSING_ARTIST_ID = 'missingartistid'
        LIBRARY_LAST_UPDATED ='librarylastupdated'
        LIBRARY_LAST_CLEANED = 'librarylastcleaned'
        ARTIST_LINKS_UPDATED = 'artistlinksupdated'
        SONGS_LAST_ADDED = 'songslastadded'
        ALBUMS_LAST_ADDED = 'albumslastadded'
        ARTISTS_LAST_ADDED = 'artistslastadded'
        GENRES_LAST_ADDED = 'genreslastadded'
        SONGS_MODIFIED = 'songsmodified'
        ALBUMS_MODIFIED = 'albumsmodified'
        ARTISTS_MODIFIED = 'artistsmodified'
      end
    end
  end
end

