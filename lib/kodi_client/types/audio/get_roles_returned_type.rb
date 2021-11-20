# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # return type for AudioLibrary.GetRoles
      class GetRolesReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :roles, :limits

        type_mapping ['roles', AudioDetailsRole, true], ['limits', List::ListLimitsReturned]

        def initialize(roles, limits)
          @roles = roles
          @limits = limits
        end
      end
    end
  end
end



