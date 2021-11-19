# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Album.ReleaseType https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Album.ReleaseType
      module AudioAlbumReleaseType
        extend Extensions::Iterable

        ALBUM = 'album'
        SINGLE = 'single'
      end
    end
  end
end
