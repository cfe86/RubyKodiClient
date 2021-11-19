# frozen_string_literal: true

module KodiClient
  module Types
    module Favourites
      # Favourite.Type https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Type
      module Type
        extend Extensions::Iterable

        MEDIA = 'media'
        WINDOW = 'window'
        SCRIPT = 'script'
        ANDROID_APP = 'androidapp'
        UNKNOWN = 'unknown'
      end
    end
  end
end
