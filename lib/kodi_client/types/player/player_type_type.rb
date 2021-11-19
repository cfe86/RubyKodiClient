# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Type https://kodi.wiki/view/JSON-RPC_API/v12#Player.Type
      module PlayerType
        extend Extensions::Iterable

        VIDEO = 'video'
        AUDIO = 'audio'
        PICTURE = 'picture'
      end
    end
  end
end
