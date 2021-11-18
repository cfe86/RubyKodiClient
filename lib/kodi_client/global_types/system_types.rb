# frozen_string_literal: true

require 'kodi_client/util/iterable'
require 'kodi_client/util/comparable'
require 'kodi_client/util/creatable'

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
        extend Creatable

        attr_reader :can_hibernate, :can_reboot, :can_shutdown, :can_suspend

        def initialize(can_hibernate, can_reboot, can_shutdown, can_suspend)
          @can_hibernate = can_hibernate
          @can_reboot = can_reboot
          @can_shutdown = can_shutdown
          @can_suspend = can_suspend
        end
      end
    end
  end
end
