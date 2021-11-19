# frozen_string_literal: true

module KodiClient
  module Types
    module Application
      # Application.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#Application.Property.Value
      class PropertyValue
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :name, :version, :muted, :volume

        type_mapping ['version', Version]

        def initialize(name, version, muted, volume)
          @name = name
          @version = version
          @muted = muted
          @volume = volume
        end
      end
    end
  end
end
