# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # Global.IncrementDecrement https://kodi.wiki/view/JSON-RPC_API/v12#Global.IncrementDecrement
      module IncrementDecrement
        extend Extensions::Iterable

        INCREMENT = 'increment'
        DECREMENT = 'decrement'
      end
    end
  end
end
