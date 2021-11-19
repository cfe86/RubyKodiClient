# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Fields.Files https://kodi.wiki/view/JSON-RPC_API/v12#List.Fields.Files
      module ListFieldFiles
        extend Extensions::Iterable

        ALBUM = 'album'
        ALBUM_ARTIST = 'albumartist'
        ALBUM_ARTIST_ID = 'albumartistid'
        ALBUM_ID = 'albumid'
        ALBUM_LABEL = 'albumlabel'
        ART = 'art'
        ARTIST = 'artist'
        ARTIST_ID = 'artistid'
        CAST = 'cast'
        COMMENT = 'comment'
        COUNTRY = 'country'
        DATE_ADDED = 'dateadded'
        DESCRIPTION = 'description'
        DIRECTOR = 'director'
        DISC = 'disc'
        DISPLAY_ARTIST = 'displayartist'
        DURATION = 'duration'
        EPISODE = 'episode'
        EPISODE_GUIDE = 'episodeguide'
        FAN_ART = 'fanart'
        FILE = 'file'
        FIRST_AIRED = 'firstaired'
        GENRE = 'genre'
        GENRE_ID = 'genreid'
        IMDB_NUMBER = 'imdbnumber'
        LAST_MODIFIED = 'lastmodified'
        LAST_PLAYED = 'lastplayed'
        LYRICS = 'lyrics'
        MIMETYPE = 'mimetype'
        MOOD = 'mood'
        MPAA = 'mpaa'
        MUSICBRAINZ_ALBUM_ARTIST_ID = 'musicbrainzalbumartistid'
        MUSICBRAINZ_ALBUM_ID = 'musicbrainzalbumid'
        MUSICBRAINZ_ARTIST_ID = 'musicbrainzartistid'
        MUSICBRAINZ_TRACK_ID = 'musicbrainztrackid'
        ORIGINAL_TITLE = 'originaltitle'
        PLAY_COUNT = 'playcount'
        PLOT = 'plot'
        PLOT_OUTLINE = 'plotoutline'
        PREMIERED = 'premiered'
        PRODUCTION_CODE = 'productioncode'
        RATING = 'rating'
        RESUME = 'resume'
        RUNTIME = 'runtime'
        SEASON = 'season'
        SET = 'set'
        SET_ID = 'setid'
        SHOW_LINK = 'showlink'
        SHOW_TITLE = 'showtitle'
        SIZE = 'size'
        SORT_TITLE = 'sorttitle'
        SPECIAL_SORT_EPISODE = 'specialsortepisode'
        SPECIAL_SORT_SEASON = 'specialsortseason'
        STREAM_DETAILS = 'streamdetails'
        STUDIO = 'studio'
        STYLE = 'style'
        TAG = 'tag'
        TAGLINE = 'tagline'
        THEME = 'theme'
        THUMBNAIL = 'thumbnail'
        TITLE = 'title'
        TOP250 = 'top250'
        TRACK = 'track'
        TRAILER = 'trailer'
        TV_SHOW_ID = 'tvshowid'
        UNIQUE_ID = 'uniqueid'
        VOTES = 'votes'
        WATCHED_EPISODES = 'watchedepisodes'
        WRITER = 'writer'
        YEAR = 'year'
      end
    end
  end
end
