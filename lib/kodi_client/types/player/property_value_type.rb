# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#Player.Property.Name
      class PropertyValue
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :audio_streams, :cache_percentage, :can_change_speed, :can_move, :can_repeat, :can_rotate,
                    :can_seek, :can_shuffle, :can_zoom, :current_audio_stream, :current_subtitle, :current_video_stream,
                    :live, :party_mode, :percentage, :playlist_id, :position, :repeat, :shuffled, :speed,
                    :subtitle_enabled, :subtitles, :time, :total_time, :type, :video_streams

        type_mapping ['audiostreams', AudioStream, true], ['currentaudiostream', AudioStream],
                     ['currentsubtitle', Subtitle], ['currentvideostream', VideoStream],
                     ['subtitles', Subtitle, true], ['time', Global::GlobalTime],
                     ['totaltime', Global::GlobalTime], ['videostreams', VideoStream, true]

        def initialize(audio_streams, cache_percentage, can_change_speed, can_move, can_repeat, can_rotate, can_seek,
                       can_shuffle, can_zoom, current_audio_stream, current_subtitle, current_video_stream, live,
                       party_mode, percentage, playlist_id, position, repeat, shuffled, speed,
                       subtitle_enabled, subtitles, time, total_time, type, video_streams)
          type = type.nil? ? PlayerType::VIDEO : type
          playlist_id = playlist_id.nil? ? -1 : playlist_id
          position = position.nil? ? -1 : position
          repeat = repeat.nil? ? PlayerRepeat::OFF : repeat

          @audio_streams = audio_streams
          @cache_percentage = cache_percentage
          @can_change_speed = can_change_speed
          @can_move = can_move
          @can_repeat = can_repeat
          @can_rotate = can_rotate
          @can_seek = can_seek
          @can_shuffle = can_shuffle
          @can_zoom = can_zoom
          @current_audio_stream = current_audio_stream
          @current_subtitle = current_subtitle
          @current_video_stream = current_video_stream
          @live = live
          @party_mode = party_mode
          @percentage = percentage
          @playlist_id = playlist_id
          @position = position
          @repeat = repeat
          @shuffled = shuffled
          @speed = speed
          @subtitle_enabled = subtitle_enabled
          @subtitles = subtitles
          @time = time
          @total_time = total_time
          @type = type
          @video_streams = video_streams
        end
      end
    end
  end
end
