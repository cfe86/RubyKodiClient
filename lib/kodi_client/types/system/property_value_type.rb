# frozen_string_literal: true

module KodiClient
  module Types
    module System
      # System.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#System.Property.Value
      class PropertyValue
        include Extensions::Comparable
        extend Extensions::Creatable

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
