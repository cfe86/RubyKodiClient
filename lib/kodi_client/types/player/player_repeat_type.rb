# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Repeat https://kodi.wiki/view/JSON-RPC_API/v12#Player.Repeat
      module PlayerRepeat
        extend Extensions::Iterable

        OFF = 'off'
        ONE = 'one'
        ALL = 'all'
        CYCLE = 'cycle'
      end
    end
  end
end
