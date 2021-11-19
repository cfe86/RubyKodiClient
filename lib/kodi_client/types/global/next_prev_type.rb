# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # enum for prev/next
      module NextPrev
        extend Extensions::Iterable

        NEXT = 'next'
        PREV = 'previous'
        ON = 'on'
        OFF = 'off'
      end
    end
  end
end
