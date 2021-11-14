# frozen_string_literal: true

require_relative 'item_types'
require_relative 'global_types'
require_relative '../util/comparable'
require_relative '../util/iterable'

module KodiClient
  module Types
    module Player

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
      end

      # player id and type
      class Player
        include Comparable

        attr_reader :player_id, :player_type, :type, :name, :plays_audio, :plays_video

        def initialize(hash)
          @player_id = hash['playerid']
          @player_type = hash['playertype']
          @type = hash['type']
          @name = hash['name']
          @plays_audio = hash['playsaudio']
          @plays_video = hash['playsvideo']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Player Subtitle https://kodi.wiki/view/JSON-RPC_API/v12#Player.Subtitle
      class Subtitle
        include Comparable

        attr_reader :index, :is_default, :is_forced, :is_impaired, :language, :name

        def initialize(hash)
          @index = hash['index']
          @is_default = hash['isdefault']
          @is_forced = hash['isforced']
          @is_impaired = hash['isimpaired']
          @language = hash['language']
          @name = hash['name']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Player.Audio.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Audio.Stream
      class AudioStream
        include Comparable

        attr_reader :bitrate, :channels, :codec, :index, :is_default, :is_forced, :is_original, :language,
                    :name, :sample_rate

        def initialize(hash)
          @bitrate = hash['bitrate']
          @channels = hash['channels']
          @codec = hash['codec']
          @index = hash['index']
          @is_default = hash['isdefault']
          @is_forced = hash['isforced']
          @is_original = hash['isoriginal']
          @language = hash['language']
          @name = hash['name']
          @sample_rate = hash['samplerate']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # Player.Video.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Video.Stream
      class VideoStream
        include Comparable

        attr_reader :codec, :height, :index, :language, :name, :width, :duration, :aspect

        def initialize(hash)
          @codec = hash['codec']
          @height = hash['height']
          @index = hash['index']
          @language = hash['language']
          @name = hash['name']
          @width = hash['width']
          @duration = hash['duration']
          @aspect = hash['aspect']
        end

        def ==(other)
          compare(self, other)
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

        def initialize(hash)
          @audio_streams = hash['audiostreams'].map { |it| AudioStream.new(it) }
          @cache_percentage = hash['cachepercentage']
          @can_change_speed = hash['canchangespeed']
          @can_move = hash['canmove']
          @can_repeat = hash['canrepeat']
          @can_rotate = hash['canrotate']
          @can_seek = hash['canseek']
          @can_shuffle = hash['canshuffle']
          @can_zoom = hash['canzoom']
          @current_audio_stream = AudioStream.new(hash['currentaudiostream'])
          @current_subtitle = Subtitle.new(hash['currentsubtitle'])
          @current_video_stream = VideoStream.new(hash['currentvideostream'])
          @live = hash['live']
          @party_mode = hash['partymode']
          @percentage = hash['percentage']
          @playlist_id = hash['playlistid'].nil? ? -1 : hash['playlistid']
          @position = hash['position'].nil? ? -1 : hash['position']
          @position = hash['position'].nil? ? -1 : hash['position']
          @repeat = hash['repeat'].nil? ? PlayerRepeat::OFF : hash['repeat']
          @shuffled = hash['shuffled']
          @speed = hash['speed']
          @subtitle_enabled = hash['subtitleenabled']
          @subtitles = hash['subtitles'].map { |it| Subtitle.new(it) }
          @time = Types::Global::GlobalTime.new(hash['time'])
          @total_time = Types::Global::GlobalTime.new(hash['totaltime'])
          @type = hash['type'].nil? ? PlayerType::VIDEO : hash['type']
          @video_streams = hash['videostreams'].map { |it| VideoStream.new(it) }
        end

        def ==(other)
          compare(self, other)
        end
      end

      # return value for Player.GetViewMode
      class PlayerViewMode
        include Comparable

        attr_reader :nonlinear_stretch, :pixel_ratio, :vertical_shift, :view_mode, :zoom

        def initialize(hash)
          @nonlinear_stretch = hash['nonlinearstretch']
          @pixel_ratio = hash['pixelratio']
          @vertical_shift = hash['verticalshift']
          @view_mode = hash['viewed']
          @zoom = hash['zoom']
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
