# frozen_string_literal: true

require 'kodi_client/global_types/item_types'
require 'kodi_client/global_types/global_types'
require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'

module KodiClient
  module Types
    module Player

      # enum for in/out zoom
      module Zoom
        extend Iterable

        IN = 'in'
        OUT = 'out'
      end

      # Player.ViewMode https://kodi.wiki/view/JSON-RPC_API/v12#Player.ViewMode
      module ViewMode
        extend Iterable

        NORMAL = 'normal'
        ZOOM = 'zoom'
        STRETCH_4x3 = 'strech4x3'
        WIDE_ZOOM = 'widezoom'
        STRETCH_16x9 = 'stretch16x9'
        ORIGINAL = 'original'
        STRETCH_16x9_NONLIN = 'stretch16x9nonline'
        ZOOM_120_WIDTH = 'zoom120width'
        ZOOM_110_WIDTH = 'zoom110width'
      end

      # player types
      module PlayerVisibilityType
        extend Iterable

        INTERNAL = 'internal'
        EXTERNAL = 'external'
        REMOTE = 'remote'
      end

      # Player.Type https://kodi.wiki/view/JSON-RPC_API/v12#Player.Type
      module PlayerType
        extend Iterable

        VIDEO = 'video'
        AUDIO = 'audio'
        PICTURE = 'picture'
      end

      # Player.Repeat https://kodi.wiki/view/JSON-RPC_API/v12#Player.Repeat
      module PlayerRepeat
        extend Iterable

        OFF = 'off'
        ONE = 'one'
        ALL = 'all'
        CYCLE = 'cycle'
      end

      # player speed enum, -32 to 32
      module PlayerSpeed
        extend Iterable

        MINUS_32 = -32
        MINUS_16 = -16
        MINUS_8 = -8
        MINUS_4 = -4
        MINUS_2 = -2
        MINUS_1 = -1
        NEUTRAL = 0
        PLUS_1 = 1
        PLUS_2 = 2
        PLUS_4 = 4
        PLUS_8 = 8
        PLUS_16 = 16
        PLUS_32 = 32
      end

      # player id and type
      class Player
        include Comparable
        extend Creatable

        attr_reader :player_id, :player_type, :type, :name, :plays_audio, :plays_video

        def initialize(player_id, player_type, type, name, plays_audio, plays_video)
          @player_id = player_id
          @player_type = player_type
          @type = type
          @name = name
          @plays_audio = plays_audio
          @plays_video = plays_video
        end
      end

      # Player Subtitle https://kodi.wiki/view/JSON-RPC_API/v12#Player.Subtitle
      class Subtitle
        include Comparable
        extend Creatable

        attr_reader :index, :is_default, :is_forced, :is_impaired, :language, :name

        def initialize(index, is_default, is_forced, is_impaired, language, name)
          @index = index
          @is_default = is_default
          @is_forced = is_forced
          @is_impaired = is_impaired
          @language = language
          @name = name
        end
      end

      # Player.Audio.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Audio.Stream
      class AudioStream
        include Comparable
        extend Creatable

        attr_reader :bitrate, :channels, :codec, :index, :is_default, :is_forced, :is_original, :language,
                    :name, :sample_rate

        def initialize(bitrate, channels, codec, index, is_default, is_forced, is_original, language, name, sample_rate)
          @bitrate = bitrate
          @channels = channels
          @codec = codec
          @index = index
          @is_default = is_default
          @is_forced = is_forced
          @is_original = is_original
          @language = language
          @name = name
          @sample_rate = sample_rate
        end
      end

      # Player.Video.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Video.Stream
      class VideoStream
        include Comparable
        extend Creatable

        attr_reader :codec, :height, :index, :language, :name, :width, :duration, :aspect

        def initialize(codec, height, index, language, name, width, duration, aspect)
          @codec = codec
          @height = height
          @index = index
          @language = language
          @name = name
          @width = width
          @duration = duration
          @aspect = aspect
        end
      end

      # Player.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#Player.Property.Name
      module PropertyName
        extend Iterable

        AUDIOSTREAMS = 'audiostreams'
        CANCHANGESPEED = 'canchangespeed'
        CANMOVE = 'canmove'
        CANREPEAT = 'canrepeat'
        CANROTATE = 'canrotate'
        CANSEEK = 'canseek'
        CANSHUFFLE = 'canshuffle'
        CANZOOM = 'canzoom'
        CURRENTAUDIOSTREAM = 'currentaudiostream'
        CURRENTSUBTITLE = 'currentsubtitle'
        CURRENTVIDEOSTREAM = 'currentvideostream'
        LIVE = 'live'
        PARTYMODE = 'partymode'
        PERCENTAGE = 'percentage'
        PLAYLISTID = 'playlistid'
        POSITION = 'position'
        REPEAT = 'repeat'
        SHUFFLED = 'shuffled'
        SPEED = 'speed'
        SUBTITLEENABLED = 'subtitleenabled'
        SUBTITLES = 'subtitles'
        TIME = 'time'
        TOTALTIME = 'totaltime'
        TYPE = 'type'
        VIDEOSTREAMS = 'videostreams'
      end

      # Player.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#Player.Property.Name
      class PropertyValue
        include Comparable
        extend Creatable

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

      # return value for Player.GetViewMode
      class PlayerViewMode
        include Comparable
        extend Creatable

        attr_reader :nonlinear_stretch, :pixel_ratio, :vertical_shift, :view_mode, :zoom

        def initialize(nonlinear_stretch, pixel_ratio, vertical_shift, view_mode, zoom)
          @nonlinear_stretch = nonlinear_stretch
          @pixel_ratio = pixel_ratio
          @vertical_shift = vertical_shift
          @view_mode = view_mode
          @zoom = zoom
        end
      end

      # Player.Position.Time https://kodi.wiki/view/JSON-RPC_API/v12#Player.Position.Time
      class PlayerPositionTime
        include Comparable
        extend Creatable

        attr_reader :hours, :minutes, :seconds, :milliseconds

        def initialize(hours, minutes, seconds, milliseconds)
          @hours = hours
          @minutes = minutes
          @seconds = seconds
          @milliseconds = milliseconds
        end
      end

      # defines  the jump size for seek
      module SeekJump
        include Iterable

        SMALL_FORWARD = 'smallforward'
        SMALL_BACKWARD = 'smallbackward'
        BIG_FORWARD = 'bigforward'
        BIG_BACKWARD = 'bigbackward'
      end

      # return value of Player.Seek
      class SeekReturned
        include Comparable
        extend Creatable

        attr_reader :percentage, :time, :total_time

        type_mapping ['time', Global::GlobalTime], ['totaltime', Global::GlobalTime]

        def initialize(percentage, time, total_time)
          @percentage = percentage
          @time = time
          @total_time = total_time
        end
      end
    end
  end
end
