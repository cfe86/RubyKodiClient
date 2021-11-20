# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Details.File https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.File
      module VideoDetailsFile
        include VideoDetailsItem

        attr_reader :director, :resume, :runtime, :stream_details

        def video_details_file_mappings
          [
            ['resume', VideoResume],
            ['streamdetails', StreamDetails]
          ] + video_details_item_mappings
        end

        def video_details_file_by_hash(hash)
          video_details_file(*Extensions::Creatable.hash_to_arr(hash, %w[director resume runtime stream_details 
                                                                         date_added file last_played plot title art 
                                                                         play_count fan_art thumbnail label],
                                                                video_details_file_mappings))
        end

        def video_details_file(director, resume, runtime, stream_details, date_added, file, last_played, plot, title,
                               art, play_count, fan_art, thumbnail, label)
          @director = director
          @resume = resume
          @runtime = runtime
          @stream_details = stream_details
          video_details_item(date_added, file, last_played, plot, title, art, play_count, fan_art, thumbnail, label)
        end
      end
    end
  end
end
