# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'
require 'kodi_client/global_types/item_types'

module KodiClient
  module Types
    module Profiles

      # Profiles.Fields.Profile https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Fields.Profile
      module FieldsProfile
        extend Iterable

        LOCK_MODE = 'lockmode'
        THUMBNAIL = 'thumbnail'
      end

      # Profiles.Details.Profile https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Details.Profile
      class DetailsProfile
        include Comparable
        include Items::ItemDetailsBase
        extend Creatable

        attr_reader :lock_mode, :thumbnail

        fields_to_map %w[lock_mode thumbnail label]

        def initialize(lock_mode, thumbnail, label)
          @lock_mode = lock_mode
          @thumbnail = thumbnail
          item_details_base(label)
        end

        def ==(other)
          compare(self, other)
        end
      end

      # return type for Profiles.GetProfiles
      class GetProfilesReturned
        include Comparable
        extend Creatable

        attr_reader :limits, :profiles

        type_mapping ['limits', List::ListLimitsReturned], ['profiles', DetailsProfile, true]

        def initialize(limits, profiles)
          @limits = limits
          @profiles = profiles
        end
      end

      # Profiles.Password https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Password
      class ProfilePassword
        include Comparable
        extend Creatable

        attr_reader :value, :encryption

        def initialize(value, encryption = Types::Global::PasswordEncryption::MD5)
          @value = value
          @encryption = encryption
        end
      end
    end
  end
end
