# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # defines  the jump size for seek
      module SeekJump
        include Extensions::Iterable

        SMALL_FORWARD = 'smallforward'
        SMALL_BACKWARD = 'smallbackward'
        BIG_FORWARD = 'bigforward'
        BIG_BACKWARD = 'bigbackward'
      end
    end
  end
end
