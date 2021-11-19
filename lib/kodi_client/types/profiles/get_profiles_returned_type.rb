# frozen_string_literal: true

module KodiClient
  module Types
    module Profiles
      # return type for Profiles.GetProfiles
      class GetProfilesReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :limits, :profiles

        type_mapping ['limits', List::ListLimitsReturned], ['profiles', DetailsProfile, true]

        def initialize(limits, profiles)
          @limits = limits
          @profiles = profiles
        end
      end
    end
  end
end
