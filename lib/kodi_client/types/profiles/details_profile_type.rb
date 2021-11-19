# frozen_string_literal: true

module KodiClient
  module Types
    module Profiles
      # Profiles.Details.Profile https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Details.Profile
      class DetailsProfile
        include Extensions::Comparable
        include Items::ItemDetailsBase
        extend Extensions::Creatable

        attr_reader :lock_mode, :thumbnail

        fields_to_map %w[lock_mode thumbnail label]

        def initialize(lock_mode, thumbnail, label)
          @lock_mode = lock_mode
          @thumbnail = thumbnail
          item_details_base(label)
        end
      end
    end
  end
end
