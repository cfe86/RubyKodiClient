# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Audio.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Audio.Stream
      class AudioStream
        include Extensions::Comparable
        extend Extensions::Creatable

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
    end
  end
end
