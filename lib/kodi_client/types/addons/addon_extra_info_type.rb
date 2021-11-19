# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # Addon.Details.extrainfo https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Details
      class AddonExtraInfo
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :key, :value

        def initialize(key, value)
          @key = key
          @value = value
        end
      end
    end
  end
end
