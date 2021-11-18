# frozen_string_literal: true

require 'kodi_client/kodi_module'
require 'kodi_client/types/application_types'

module KodiClient
  module Method
    # contains all Kodi Application methods
    class AudioLibrary < KodiModule

      CLEAN = 'AudioLibrary.Clean'
      EXPORT = 'AudioLibrary.Export'
      GET_ALBUM_DETAILS = 'AudioLibrary.GetAlbumDetails'
      GET_ALBUMS = 'AudioLibrary.GetAlbums'

      def clean(show_dialogs = true, kodi_id = 1)
        request = KodiRequest.new(kodi_id, CLEAN, { 'showdialogs' => show_dialogs })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def export(path, kodi_id = 1)
        request = KodiRequest.new(kodi_id, EXPORT, { 'options' => { 'path' => path } })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_album_details(album_id, properties = Types::Audio::AudioFieldsAlbum.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ALBUM_DETAILS, { 'albumid' => album_id, 'properties' => properties })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_albums(properties = Types::Audio::AudioFieldsAlbum.all_properties,
                     limits = Types::List::ListLimits.new(0, 50),
                     sort = Types::List::ListSort.new, include_singles = false, all_roles = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ALBUMS,
                                  { 'properties' => properties,
                                    'limits' => { 'start' => limits.list_start, 'end' => limits.list_end },
                                    'sort' => { 'ignorearticle' => sort.ignore_article, 'method' => sort.method,
                                                'order' => sort.order,
                                                'useartistsortname' => sort.use_artist_sort_name },
                                    'includesingles' => include_singles, 'allroles' => all_roles })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
