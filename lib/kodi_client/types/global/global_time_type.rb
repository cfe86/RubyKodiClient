# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # Global.Time https://kodi.wiki/view/JSON-RPC_API/v12#Global.Time
      class GlobalTime
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :hours, :minutes, :seconds, :milliseconds

        def initialize(hours, minutes, seconds, milliseconds)
          @hours = hours
          @minutes = minutes
          @seconds = seconds
          @milliseconds = milliseconds
        end
      end
    end
  end
end
