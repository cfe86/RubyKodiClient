# frozen_string_literal: true

require 'kodi_client/util/iterable'
require 'kodi_client/util/comparable'

module KodiClient
  module Types
    module System

      # System.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#System.Property.Name
      module PropertyName
        extend Iterable

        CAN_SHUTDOWN = 'canshutdown'
        CAN_SUSPEND = 'cansuspend'
        CAN_HIBERNATE = 'canhibernate'
        CAN_REBOOT = 'canreboot'
      end

      # System.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#System.Property.Value
      class PropertyValue
        include Comparable

        attr_reader :can_hibernate, :can_reboot, :can_shutdown, :can_suspend

        def initialize(hash)
          @can_hibernate = hash['canhibernate']
          @can_reboot = hash['canreboot']
          @can_shutdown = hash['canshutdown']
          @can_suspend = hash['cansuspend']
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
