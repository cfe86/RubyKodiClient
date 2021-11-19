# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # Global.Toggle https://kodi.wiki/view/JSON-RPC_API/v12#Global.Toggle
      module Toggle
        extend Extensions::Iterable

        TOGGLE = 'toggle'
        TRUE = true
        FALSE = false
      end
    end
  end
end
