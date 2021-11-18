# frozen_string_literal: true

module KodiClient
  module Types
    module Global

      # Global.Toggle https://kodi.wiki/view/JSON-RPC_API/v12#Global.Toggle
      module Toggle
        extend Iterable

        TOGGLE = 'toggle'
        TRUE = true
        FALSE = false
      end

      # rotate for clockwise and counter clockwise
      module Rotate
        extend Iterable

        CLOCKWISE = 'clockwise'
        COUNTER_CLOCKWISE = 'counterclockwise'
      end

      # direction for left, right, up, down
      module Direction
        extend Iterable

        LEFT = 'left'
        RIGHT = 'right'
        UP = 'up'
        DOWN = 'down'
      end

      # enum for prev/next
      module NextPrev
        extend Iterable

        NEXT = 'next'
        PREV = 'previous'
        ON = 'on'
        OFF = 'off'
      end

      # Global.IncrementDecrement https://kodi.wiki/view/JSON-RPC_API/v12#Global.IncrementDecrement
      module IncrementDecrement
        extend Iterable

        INCREMENT = 'increment'
        DECREMENT = 'decrement'
      end

      # id/label type
      class IdLabel
        include Comparable
        extend Creatable

        attr_reader :id, :label

        def initialize(id, label)
          @id = id
          @label = label
        end
      end

      # id/name type
      class IdName
        include Comparable
        extend Creatable

        attr_reader :id, :name

        def initialize(id, name)
          @id = id
          @name = name
        end
      end

      # Global.Time https://kodi.wiki/view/JSON-RPC_API/v12#Global.Time
      class GlobalTime
        include Comparable
        extend Creatable

        attr_reader :hours, :minutes, :seconds, :milliseconds

        def initialize(hours, minutes, seconds, milliseconds)
          @hours = hours
          @minutes = minutes
          @seconds = seconds
          @milliseconds = milliseconds
        end
      end

      # available Password Encryptions
      module PasswordEncryption
        extend Iterable

        NONE = 'none'
        MD5 = 'md5'
      end
    end
  end
end
