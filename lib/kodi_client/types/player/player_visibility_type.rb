# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # player types
      module PlayerVisibility
        extend Extensions::Iterable

        INTERNAL = 'internal'
        EXTERNAL = 'external'
        REMOTE = 'remote'
      end
    end
  end
end
