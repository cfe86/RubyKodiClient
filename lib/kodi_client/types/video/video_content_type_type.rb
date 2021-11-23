# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # VideoLibrary.Scan hhttps://kodi.wiki/view/JSON-RPC_API/v12#VideoLibrary
      module VideoContentType
        extend Extensions::Iterable

        VIDEO = 'video'
        MOVIES = 'movies'
        TV_SHOWS = 'tvshows'
        MUSIC_VIDEOS = 'musicvideos'
      end
    end
  end
end

