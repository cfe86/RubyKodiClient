# frozen_string_literal: true

module KodiClient
  module Types
    module Library
      # Library.Fields.Source https://kodi.wiki/view/JSON-RPC_API/v12#Library.Fields.Source
      module LibraryFieldsSource
        extend Extensions::Iterable

        FILE = 'file'
        PATHS = 'paths'
      end
    end
  end
end


