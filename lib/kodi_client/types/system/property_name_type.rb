# frozen_string_literal: true

module KodiClient
  module Types
    module System
      # System.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#System.Property.Name
      module PropertyName
        extend Extensions::Iterable

        CAN_SHUTDOWN = 'canshutdown'
        CAN_SUSPEND = 'cansuspend'
        CAN_HIBERNATE = 'canhibernate'
        CAN_REBOOT = 'canreboot'
      end
    end
  end
end
