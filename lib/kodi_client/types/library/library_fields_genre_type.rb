# frozen_string_literal: true

module KodiClient
  module Types
    module Library
      # Library.Fields.Genre https://kodi.wiki/view/JSON-RPC_API/v12#Library.Fields.Genre
      module LibraryFieldsGenre
        extend Extensions::Iterable

        TITLE = 'title'
        THUMBNAIL = 'thumbnail'
        SOURCE_ID = 'sourceid'
      end
    end
  end
end

