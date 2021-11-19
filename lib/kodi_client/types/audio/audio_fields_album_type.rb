# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Fields.Album https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Fields.Album
      module AudioFieldsAlbum
        extend Extensions::Iterable

        #album id
        ALBUM_DURATION = 'albumduration'
        ALBUM_LABEL = 'albumlabel'
        ALBUM_STATUS = 'albumstatus'
        ART = 'art'
        ARTIST = 'artist'
        ARTIST_ID = 'artistid'
        COMPILATION = 'compilation'
        DATE_ADDED = 'dateadded'
        DATE_MODIFIED = 'datemodified'
        DATE_NEW = 'datenew'
        DESCRIPTION = 'description'
        DISPLAY_ARTIST = 'displayartist'
        FAN_ART = 'fanart'
        GENRE = 'genre'
        IS_BOX_SET = 'isboxset'
        LAST_PLAYED = 'lastplayed'
        MOOD = 'mood'
        MUSICBRAINZ_ALBUM_ARTIST_ID = 'musicbrainzalbumartistid'
        MUSICBRAINZ_ALBUM_ID = 'musicbrainzalbumid'
        MUSICBRAINZ_RELEASE_GROUP_ID = 'musicbrainzreleasegroupid'
        ORIGINAL_DATE = 'originaldate'
        PLAY_COUNT = 'playcount'
        RATING = 'rating'
        RELEASE_DATE = 'releasedate'
        RELEASE_TYPE = 'releasetype'
        SONG_GENRES = 'songgenres'
        SORT_ARTIST = 'sortartist'
        SOURCE_ID = 'sourceid'
        STYLE = 'style'
        THEME = 'theme'
        THUMBNAIL = 'thumbnail'
        TITLE = 'title'
        TOTAL_DISCS = 'totaldiscs'
        TYPE = 'type'
        USER_RATING = 'userrating'
        VOTES = 'votes'
        YEAR = 'year'
      end
    end
  end
end
