# frozen_string_literal: true

module KodiClient
  module Types
    module Application
      # Application.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#Application.Property.Name
      module PropertyName
        extend Extensions::Iterable

        VOLUME = 'volume'
        MUTED = 'muted'
        NAME = 'name'
        VERSION = 'version'
        SORT_TOKENS = 'sorttokens'
        LANGUAGE = 'language'
      end
    end
  end
end
