# frozen_string_literal: true

module KodiClient
  module Types
    module Favourites
      # Favourite.Details.Favourite https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Details.Favourite
      class DetailsFavourite
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :path, :thumbnail, :title, :type, :window, :window_parameter

        def initialize(path, thumbnail, title, type, window, window_parameter)
          @path = path
          @thumbnail = thumbnail
          @title = title
          @type = type
          @window = window
          @window_parameter = window_parameter
        end
      end
    end
  end
end
