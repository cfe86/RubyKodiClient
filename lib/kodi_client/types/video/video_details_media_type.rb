# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Media
      module VideoDetailsMedia
        include VideoDetailsBase

        attr_reader :title

        def video_details_media_mappings
          video_details_base_mappings
        end

        def video_details_media_by_hash(hash)
          video_details_media(*Extensions::Creatable.hash_to_arr(hash, %w[title art play_count fan_art thumbnail label]),
                              video_details_base_mappings)
        end

        def video_details_media(title, art, play_count, fan_art, thumbnail, label)
          @title = title
          video_details_base(art, play_count, fan_art, thumbnail, label)
        end
      end
    end
  end
end
