# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
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

        attr_reader :lock_mode, :thumbnail

        def initialize(hash)
          @lock_mode = hash['lockmode']
          @thumbnail = hash['thumbnail']
          item_details_base(hash)
        end

        def ==(other)
          compare(self, other)
        end
      end

      # return type for Profiles.GetProfiles
      class GetProfilesReturned
        include Comparable

        attr_reader :limits, :profiles

        def initialize(hash)
          @limits = Types::List::ListLimitsReturned.new(hash['limits'])
          @profiles = hash['profiles'].nil? ? [] : hash['profiles'].map { |it| Types::Profiles::DetailsProfile.new(it) }
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Profiles.Password https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Password
      class ProfilePassword
        include Comparable

        attr_reader :value, :encryption

        def initialize(value, encryption = Types::Global::PasswordEncryption::MD5)
          @value = value
          @encryption = encryption
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
