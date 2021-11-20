# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Details.Item https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Item
      module VideoDetailsItem
        include VideoDetailsMedia

        attr_reader :date_added, :file, :last_played, :plot

        def video_details_item_mappings
          video_details_media_mappings
        end

        def video_details_item_by_hash(hash)
          video_details_item(*Extensions::Creatable.hash_to_arr(hash, %w[date_added file last_played plot title art
                                                                         play_count fan_art thumbnail label],
                                                                video_details_item_mappings))
        end

        def video_details_item(date_added, file, last_played, plot, title, art, play_count, fan_art, thumbnail, label)
          @date_added = date_added
          @file = file
          @last_played = last_played
          @plot = plot
          video_details_media(title, art, play_count, fan_art, thumbnail, label)
        end
      end
    end
  end
end
