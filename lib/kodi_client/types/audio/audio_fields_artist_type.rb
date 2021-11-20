# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Fields.Artist https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Fields.Artist
      module AudioFieldsArtist
        extend Extensions::Iterable

        INSTRUMENT = 'instrument'
        STYLE = 'style'
        MOOD = 'mood'
        BORN = 'born'
        FORMED = 'formed'
        DESCRIPTION = 'description'
        GENRE = 'genre'
        DIED = 'died'
        DISBANDED = 'disbanded'
        YEARS_ACTIVE = 'yearsactive'
        MUSICBRAINZ_ARTIST_ID = 'musicbrainzartistid'
        FAN_ART = 'fanart'
        THUMBNAIL = 'thumbnail'
        COMPILATION_ARTIST = 'compilationartist'
        DATE_ADDED = 'dateadded'
        ROLES = 'roles'
        SONG_GENRES = 'songgenres'
        IS_ALBUM_ARTIST = 'isalbumartist'
        SORT_NAME = 'sortname'
        TYPE = 'type'
        GENDER = 'gender'
        DISAMBIGUATION = 'disambiguation'
        ART = 'art'
        SOURCE_ID = 'sourceid'
        DATE_MODIFIED = 'datemodified'
        DATE_NEW = 'datenew'
      end
    end
  end
end
