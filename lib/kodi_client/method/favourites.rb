# frozen_string_literal: true

require 'kodi_client/kodi_module'
require 'kodi_client/global_types/favourites_types'

module KodiClient
  module Modules
    # contains all Kodi Application methods
    class Favourites < KodiModule

      ADD_FAVOURITE = 'Favourites.AddFavourite'
      GET_FAVOURITES = 'Favourites.GetFavourites'

      def add_favourite(title, type = Types::Favourites::Type::UNKNOWN, path = nil, window = nil,
                        window_parameter = nil, thumbnail = nil, kodi_id = 1)
        params = { 'title' => title, 'type' => type }
        params['path'] = path unless path.nil?
        params['window'] = window unless window.nil?
        params['windowparameter'] = window_parameter unless window_parameter.nil?
        params['thumbnail'] = thumbnail unless thumbnail.nil?
        request = KodiRequest.new(kodi_id, ADD_FAVOURITE, params)
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_favourites(properties = Types::Favourites::FieldsFavourite.all_properties, type = nil, kodi_id = 1)
        params = { 'properties' => properties }
        params['type'] = type unless type.nil?
        request = KodiRequest.new(kodi_id, GET_FAVOURITES, params)
        json = invoke_api(request)
        result = json['result'].nil? ? nil : Types::Favourites::GetFavouriteReturned.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end
    end
  end
end

# 'path' => path,
#   'window' => window, 'windowparameter' => windowparameter,
#   'thumbnail' => thumbnail
