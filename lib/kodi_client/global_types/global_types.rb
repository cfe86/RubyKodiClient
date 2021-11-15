# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'

module KodiClient
  module Types
    module Global

      # Global.Toggle https://kodi.wiki/view/JSON-RPC_API/v12#Global.Toggle
      module Toggle
        include Iterable

        TOGGLE = 'toggle'
        TRUE = true
        FALSE = false
      end

      # rotate for clockwise and counter clockwise
      module Rotate
        include Iterable

        CLOCKWISE = 'clockwise'
        COUNTER_CLOCKWISE = 'counterclockwise'
      end

      # direction for left, right, up, down
      module Direction
        include Iterable

        LEFT = 'left'
        RIGHT = 'right'
        UP = 'up'
        DOWN = 'down'
      end

      # enum for prev/next
      module NextPrev
        include Iterable

        NEXT = 'next'
        PREV = 'previous'
        ON = 'on'
        OFF = 'off'
      end

      # Global.IncrementDecrement https://kodi.wiki/view/JSON-RPC_API/v12#Global.IncrementDecrement
      module IncrementDecrement
        include Iterable

        INCREMENT = 'increment'
        DECREMENT = 'decrement'
      end

      # id/label type
      class IdLabel
        include Comparable
        attr_reader :id, :label

        def initialize(hash)
          @id = hash['id']
          @label = hash['label']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # id/name type
      class IdName
        include Comparable
        attr_reader :id, :name

        def initialize(hash)
          @id = hash['id']
          @name = hash['name']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Global.Time https://kodi.wiki/view/JSON-RPC_API/v12#Global.Time
      class GlobalTime
        include Comparable

        attr_reader :hours, :minutes, :seconds, :milliseconds

        def initialize(hash)
          @hours = hash['hours']
          @minutes = hash['minutes']
          @seconds = hash['seconds']
          @milliseconds = hash['milliseconds']
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
