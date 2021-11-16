# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
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

        attr_reader :path, :thumbnail, :title, :type, :window, :window_parameter

        def initialize(hash)
          @path = hash['path']
          @thumbnail = hash['thumbnail']
          @title = hash['title']
          @type = hash['type']
          @window = hash['window']
          @window_parameter = hash['windowparameter']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # return type for Favourites.GetFavourites
      class GetFavouriteReturned
        include Comparable

        attr_reader :favourites, :limits

        def initialize(hash)
          @favourites = hash['favourites'].map { |it| DetailsFavourite.new(it) }
          @limits = Types::List::ListLimitsReturned.new(hash['limits'])
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
