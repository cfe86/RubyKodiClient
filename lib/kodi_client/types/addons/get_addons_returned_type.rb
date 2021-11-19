# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # getAddons return
      class GetAddonsReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :addons, :limits

        type_mapping ['addons', AddonDetails, true], ['limits', List::ListLimitsReturned]

        def initialize(addons, limits)
          @addons = addons
          @limits = limits
        end
      end
    end
  end
end
