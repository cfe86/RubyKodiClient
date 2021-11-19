# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Base
      module VideoDetailsBase
        include Media::MediaDetailsBase

        attr_reader :art, :play_count

        def video_details_base_mappings
          media_details_base_mappings
        end

        def video_details_base_by_hash(hash)
          video_details_base(*Extensions::Creatable.hash_to_arr(hash, %w[art play_count fan_art thumbnail label],
                                                                video_details_base_mappings))
        end

        def video_details_base(art, play_count, fan_art, thumbnail, label)
          @art = art
          @play_count = play_count
          media_details_base(fan_art, thumbnail, label)
        end
      end
    end
  end
end
