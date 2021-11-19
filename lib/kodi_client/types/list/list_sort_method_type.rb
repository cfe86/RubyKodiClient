# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # methods for list sorting https://kodi.wiki/view/JSON-RPC_API/v12#List.Sort
      module ListSortMethod
        extend Extensions::Iterable

        NONE = 'none'
        LABEL = 'label'
        DATE = 'date'
        SIZE = 'size'
        FILE = 'file'
        PATH = 'path'
        DRIVE_TYPE = 'drivetype'
        TITLE = 'title'
        TRACK = 'track'
        TIME = 'time'
        ARTIST = 'artist'
        ALBUM = 'album'
        ALBUM_TYPE = 'albumtype'
        GENRE = 'genre'
        COUNTRY = 'country'
        YEAR = 'year'
        RATING = 'rating'
        USER_RATING = 'userrating'
        VOTES = 'votes'
        TOP_250 = 'top250'
        PROGRAM_COUNT = 'programcount'
        PLAYLIST = 'playlist'
        EPISODE = 'episode'
        SEASON = 'season'
        TOTAL_EPISODES = 'totalepisodes'
        WATCHED_EPISODES = 'watchedepisodes'
        TV_SHOW_STATUS = 'tvshowstatus'
        TV_SHOW_TITLE = 'tvshowtitle'
        SORT_TITLE = 'sorttitle'
        PRODUCTION_CODE = 'productioncode'
        MPAA = 'mpaa'
        STUDIO = 'studio'
        DATE_ADDED = 'dateadded'
        LAST_PLAYED = 'lastplayed'
        PLAY_COUNT = 'playcount'
        LISTENERS = 'listeners'
        BITRATE = 'bitrate'
        RANDOM = 'random'
        TOTAL_DISCS = 'totaldiscs'
        ORIGINAL_DATE = 'originaldate'
        BPM = 'bpm'
      end
    end
  end
end
