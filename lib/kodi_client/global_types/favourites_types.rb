# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'
require 'kodi_client/global_types/list_types'

module KodiClient
  module Types
    module Favourites

      # Favourite.Type https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Type
      module Type
        extend Iterable

        MEDIA = 'media'
        WINDOW = 'window'
        SCRIPT = 'script'
        ANDROID_APP = 'androidapp'
        UNKNOWN = 'unknown'
      end

      # Favourite.Fields.Favourite https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Fields.Favourite
      module FieldsFavourite
        extend Iterable

        WINDOW = 'window'
        WINDOW_PARAMETER = 'windowparameter'
        THUMBNAIL = 'thumbnail'
        PATH = 'path'
      end

      # Favourite.Details.Favourite https://kodi.wiki/view/JSON-RPC_API/v12#Favourite.Details.Favourite
      class DetailsFavourite
        include Comparable
        extend Creatable

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

      # return type for Favourites.GetFavourites
      class GetFavouriteReturned
        include Comparable
        extend Creatable

        attr_reader :favourites, :limits

        def self.type_mapping
          { 'favourites' => Creatable::CreateMap.new(DetailsFavourite, true),
            'limits' => Creatable::CreateMap.new(Types::List::ListLimitsReturned) }
        end

        def initialize(favourites, limits)
          @favourites = favourites
          @limits = limits
        end
      end
    end
  end
end
