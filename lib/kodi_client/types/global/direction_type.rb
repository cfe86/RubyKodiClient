# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # direction for left, right, up, down
      module Direction
        extend Extensions::Iterable

        LEFT = 'left'
        RIGHT = 'right'
        UP = 'up'
        DOWN = 'down'
      end
    end
  end
end
