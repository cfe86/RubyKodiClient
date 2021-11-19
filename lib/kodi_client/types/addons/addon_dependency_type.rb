# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # Addon.Details.dependencies https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Details
      class AddonDependency
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :addon_id, :optional, :version

        def initialize(addon_id, optional, version)
          @addon_id = addon_id
          @optional = optional
          @version = version
        end
      end
    end
  end
end