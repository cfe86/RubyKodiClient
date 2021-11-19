# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # player speed enum, -32 to 32
      module PlayerSpeed
        extend Extensions::Iterable

        MINUS_32 = -32
        MINUS_16 = -16
        MINUS_8 = -8
        MINUS_4 = -4
        MINUS_2 = -2
        MINUS_1 = -1
        NEUTRAL = 0
        PLUS_1 = 1
        PLUS_2 = 2
        PLUS_4 = 4
        PLUS_8 = 8
        PLUS_16 = 16
        PLUS_32 = 32
      end
    end
  end
end
