# frozen_string_literal: true

require 'kodi_client/kodi_module'
require 'kodi_client/types/files_types'
require 'kodi_client/types/list_types'

module KodiClient
  module Method
    # contains all Kodi Application methods
    class Files < KodiModule

      GET_DIRECTORY = 'Files.GetDirectory'
      GET_FILE_DETAILS = 'Files.GetFileDetails'
      GET_SOURCES = 'Files.GetSources'
      PREPARE_DOWNLOAD = 'Files.PrepareDownload'
      SET_FILE_DETAILS = 'Files.SetFileDetails'

      def get_directory(directory, media = Types::Files::Media::FILES,
                        properties = Types::List::ListFieldFiles.all_properties,
                        sort = Types::List::ListSort.new,
                        limits = Types::List::ListLimits.new(0, 50), kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_DIRECTORY,
                                  {
                                    'directory' => directory,
                                    'media' => media,
                                    'properties' => properties,
                                    'sort' => { 'ignorearticle' => sort.ignore_article, 'method' => sort.method,
                                                'order' => sort.order,
                                                'useartistsortname' => sort.use_artist_sort_name },
                                    'limits' => { 'start' => limits.list_start, 'end' => limits.list_end }
                                  })
        json = invoke_api(request)
        result = KodiClient::Types::Files::GetDirectoryReturned.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_file_details(file, media = Types::Files::Media::FILES,
                           properties = Types::List::ListFieldFiles.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_FILE_DETAILS,
                                  {
                                    'file' => file,
                                    'media' => media,
                                    'properties' => properties
                                  })
        json = invoke_api(request)
        result = KodiClient::Types::List::ListItemFile.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_sources(media = Types::Files::Media::FILES,
                      sort = Types::List::ListSort.new,
                      limits = Types::List::ListLimits.new(0, 50), kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_SOURCES,
                                  {
                                    'media' => media,
                                    'sort' => { 'ignorearticle' => sort.ignore_article, 'method' => sort.method,
                                                'order' => sort.order,
                                                'useartistsortname' => sort.use_artist_sort_name },
                                    'limits' => { 'start' => limits.list_start, 'end' => limits.list_end }
                                  })
        json = invoke_api(request)
        result = KodiClient::Types::Files::GetSourcesReturned.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def prepare_download(path, kodi_id = 1)
        request = KodiRequest.new(kodi_id, PREPARE_DOWNLOAD, { 'path' => path })
        json = invoke_api(request)
        result = KodiClient::Types::Files::PrepareDownloadReturned.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def set_file_details(file, media = Types::Files::Media::VIDEO, play_count = nil, last_played = nil,
                           resume = nil, kodi_id = 1)
        params = { 'file' => file, 'media' => media}
        params['playcount'] = play_count unless play_count.nil?
        params['lastplayed'] = last_played unless last_played.nil?
        params['resume'] = resume unless resume.nil?
        request = KodiRequest.new(kodi_id, SET_FILE_DETAILS, params)
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
