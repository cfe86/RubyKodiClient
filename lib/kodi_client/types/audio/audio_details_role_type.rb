# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Role https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Role
      class AudioDetailsRole
        include Items::ItemDetailsBase
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :role_id, :title

        fields_to_map %w[role_id title label]

        def initialize(role_id, title, label)
          @role_id = role_id
          @title = title
          item_details_base(label)
        end
      end
    end
  end
end

