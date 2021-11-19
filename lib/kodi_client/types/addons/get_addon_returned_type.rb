# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # getAddon return
      class GetAddonReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :addon

        type_mapping ['addon', AddonDetails]

        def initialize(addon)
          @addon = addon
        end
      end
    end
  end
end
