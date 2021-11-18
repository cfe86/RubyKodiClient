# frozen_string_literal: true

require 'kodi_client/global_types/media_types'
require 'kodi_client/global_types/player_type'
require 'kodi_client/util/comparable'
require 'kodi_client/util/creatable'

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
          video_details_base(*Creatable.hash_to_arr(hash, %w[art play_count fan_art thumbnail label],
                                                    video_details_base_mappings))
        end

        def video_details_base(art, play_count, fan_art, thumbnail, label)
          @art = art
          @play_count = play_count
          media_details_base(fan_art, thumbnail, label)
        end
      end

      # Video.Cast https://kodi.wiki/view/JSON-RPC_API/v12#Video.Cast
      class VideoCast
        include Comparable
        extend Creatable

        attr_reader :name, :order, :role, :thumbnail

        def initialize(name, order, role, thumbnail)
          @name = name
          @order = order
          @role = role
          @thumbnail = thumbnail
        end
      end

      # Video.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Media
      module VideoDetailsMedia
        include VideoDetailsBase

        attr_reader :title

        def video_details_media_mappings
          video_details_base_mappings
        end

        def video_details_media_by_hash(hash)
          video_details_media(*Creatable.hash_to_arr(hash, %w[title art play_count fan_art thumbnail label]),
                              video_details_base_mappings)
        end

        def video_details_media(title, art, play_count, fan_art, thumbnail, label)
          @title = title
          video_details_base(art, play_count, fan_art, thumbnail, label)
        end
      end

      # Video.Details.Item https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Item
      module VideoDetailsItem
        include VideoDetailsMedia

        attr_reader :date_added, :file, :last_played, :plot

        def video_details_item_mappings
          video_details_media_mappings
        end

        def video_details_item_by_hash(hash)
          video_details_item(*Creatable.hash_to_arr(hash, %w[date_added file last_played plot title art
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

      # Video.Details.File https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.File
      module VideoDetailsFile
        include VideoDetailsItem

        attr_reader :director, :resume, :runtime, :stream_details

        def video_details_file_mappings
          mappings = {
            'resume' => Creatable::CreateMap.new(VideoResume),
            'streamdetails' => Creatable::CreateMap.new(Streams)
          }
          mappings.merge(video_details_item_mappings)
        end

        def video_details_file_by_hash(hash)
          video_details_file(*Creatable.hash_to_arr(hash, %w[director resume runtime stream_details date_added
                                                             file last_played plot title art play_count fan_art
                                                             thumbnail label], video_details_file_mappings))
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

      # Video.Resume https://kodi.wiki/view/JSON-RPC_API/v12#Video.Resume
      class VideoResume
        include Comparable
        extend Creatable

        attr_reader :position, :total

        def initialize(position, total)
          @position = position
          @total = total
        end
      end

      # Video.Streams https://kodi.wiki/view/JSON-RPC_API/v12#Video.Streams
      class Streams
        include Comparable
        extend Creatable

        attr_reader :audio, :subtitle, :video

        type_mapping ['audio', Player::AudioStream, true], ['subtitle', Player::Subtitle, true],
                     ['video', Player::VideoStream, true]

        def initialize(audio, subtitle, video)
          @audio = audio
          @subtitle = subtitle
          @video = video
        end
      end
    end
  end
end
