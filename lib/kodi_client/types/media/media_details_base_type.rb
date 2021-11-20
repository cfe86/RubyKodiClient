# frozen_string_literal: true

module KodiClient
  module Types
    module Media
      # Media.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Media.Details.Base
      module MediaDetailsBase
        include Items::ItemDetailsBase

        attr_reader :fan_art, :thumbnail

        def media_details_base_mappings
          item_details_base_mappings
        end

        def media_details_base_by_hash(hash)
          media_details_base(*Extensions::Creatable.hash_to_arr(hash, %w[fan_art thumbnail label]),
                             media_details_base_mappings)
        end

        def media_details_base(fan_art, thumbnail, label)
          @fan_art = fan_art
          @thumbnail = thumbnail
          item_details_base(label)
        end
      end
    end
  end
end
