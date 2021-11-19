# frozen_string_literal: true

module KodiClient
  module Types
    module Files
      # Files.Media https://kodi.wiki/view/JSON-RPC_API/v12#Files.Media
      module Media
        extend Extensions::Iterable

        VIDEO = 'video'
        MUSIC = 'music'
        PICTURES = 'pictures'
        FILES = 'files'
        PROGRAMS = 'programs'
      end
    end
  end
end
