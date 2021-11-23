# frozen_string_literal: true

module KodiClient
  module Methods
    # contains all Kodi System methods
    class VideoLibrary < KodiMethod

      CLEAN = 'clean'

      def clean(show_dialogs = true, content = Types::Video::VideoContentType::VIDEO, directory = '', kodi_id = 1)
        request = KodiRequest.new(kodi_id, CLEAN, { 'showdialogs' => show_dialogs, 'content' => content,
                                                    'directory' => directory })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
