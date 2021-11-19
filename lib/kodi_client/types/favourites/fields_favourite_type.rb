# frozen_string_literal: true

module KodiClient
  module Types
    module Favourites
      # Favourite.Fields.Favourite https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Fields.Favourite
      module FieldsFavourite
        extend Extensions::Iterable

        WINDOW = 'window'
        WINDOW_PARAMETER = 'windowparameter'
        THUMBNAIL = 'thumbnail'
        PATH = 'path'
      end
    end
  end
end
