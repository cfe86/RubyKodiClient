# frozen_string_literal: true

require_relative 'media_types'
require_relative 'player_type'
require_relative '../util/comparable'

module KodiClient
  module Types
    module Video

      # Video.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Base
      module VideoDetailsBase
        include Media::MediaDetailsBase

        attr_reader :art, :play_count

        def video_details_base(hash)
          @art = Types::Media::MediaArtwork.new(hash['art'])
          @play_count = ['playcount']
          media_details_base(hash)
        end
      end

      # Video.Cast https://kodi.wiki/view/JSON-RPC_API/v12#Video.Cast
      class VideoCast
        include Comparable

        attr_reader :name, :order, :role, :thumbnail

        def initialize(hash)
          @name = hash['name']
          @order = hash['order']
          @role = hash['role']
          @thumbnail = hash['thumbnail']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Video.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Media
      module VideoDetailsMedia
        include VideoDetailsBase

        attr_reader :title

        def video_details_media(hash)
          @title = hash['title']
          video_details_base(hash)
        end
      end

      # Video.Details.Item https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.Item
      module VideoDetailsItem
        include VideoDetailsMedia

        attr_reader :date_added, :file, :last_played, :plot

        def video_details_item(hash)
          @date_added = hash['dateadded']
          @file = hash['file']
          @last_played = hash['lastplayed']
          @plot = hash['plot']
          video_details_media(hash)
        end
      end

      # Video.Details.File https://kodi.wiki/view/JSON-RPC_API/v12#Video.Details.File
      module VideoDetailsFile
        include VideoDetailsItem

        attr_reader :director, :resume, :runtime, :stream_details

        def video_details_file(hash)
          @director = hash['director']
          @resume = VideoResume.new(hash['resume'])
          @runtime = hash['runtime']
          @stream_details = Streams.new(hash['streamdetails'])
          video_details_item(hash)
        end
      end

      # Video.Resume https://kodi.wiki/view/JSON-RPC_API/v12#Video.Resume
      class VideoResume
        include Comparable

        attr_reader :position, :total

        def initialize(hash)
          @position = hash['position']
          @total = hash['total']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Video.Streams https://kodi.wiki/view/JSON-RPC_API/v12#Video.Streams
      class Streams
        include Comparable

        attr_reader :audio, :subtitle, :video

        def initialize(hash)
          @audio = hash['audio'].nil? ? [] : hash['audio'].map { |it| Types::Player::AudioStream.new(it) }
          @subtitle = hash['subtitle'].nil? ? [] : hash['subtitle'].map { |it| Types::Player::Subtitle.new(it) }
          @video = hash['video'].nil? ? [] : hash['video'].map { |it| Types::Player::VideoStream.new(it) }
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
