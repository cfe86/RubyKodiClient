# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Fields.Song https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Fields.Song
      module AudioFieldsSong
        extend Extensions::Iterable

        TITLE = 'title'
        ARTIST = 'artist'
        ALBUM_ARTIST = 'albumartist'
        GENRE = 'genre'
        YEAR = 'year'
        RATING = 'rating'
        ALBUM = 'album'
        TRACK = 'track'
        DURATION = 'duration'
        COMMENT = 'comment'
        LYRICS = 'lyrics'
        MUSICBRAINZ_TRACK_ID = 'musicbrainztrackid'
        MUSICBRAINZ_ARTIST_ID = 'musicbrainzartistid'
        MUSICBRAINZ_ALBUM_ID = 'musicbrainzalbumid'
        MUSICBRAINZ_ALBUM_ARTIST_ID = 'musicbrainzalbumartistid'
        PLAY_COUNT = 'playcount'
        FAN_ART = 'fanart'
        THUMBNAIL = 'thumbnail'
        FILE = 'file'
        ALBUM_ID = 'albumid'
        LAST_PLAYED = 'lastplayed'
        DISC = 'disc'
        GENRE_ID = 'genreid'
        ARTIST_ID = 'artistid'
        DISPLAY_ARTIST = 'displayartist'
        ALBUM_ARTIST_ID = 'albumartistid'
        ALBUM_RELEASE_TYPE = 'albumreleasetype'
        DATE_ADDED = 'dateadded'
        VOTES = 'votes'
        USER_RATING = 'userrating'
        MOOD = 'mood'
        CONTRIBUTORS = 'contributors'
        DISPLAY_COMPOSER = 'displaycomposer'
        DISPLAY_CONDUCTOR = 'displayconductor'
        DISPLAY_ORCHESTRA = 'displayorchestra'
        DISPLAY_LYRICIST = 'displaylyricist'
        SORT_ARTIST = 'sortartist'
        ART = 'art'
        SOURCE_ID = 'sourceid'
        DISC_TITLE = 'disctitle'
        RELEASE_DATE = 'releasedate'
        ORIGINAL_DATE = 'originaldate'
        BPM = 'bpm'
        SAMPLE_RATE = 'samplerate'
        BITRATE = 'bitrate'
        CHANNELS = 'channels'
        DATE_MODIFIED = 'datemodified'
        DATE_NEW = 'datenew'
      end
    end
  end
end
