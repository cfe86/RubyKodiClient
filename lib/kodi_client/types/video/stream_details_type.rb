# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Streams https://kodi.wiki/view/JSON-RPC_API/v12#Video.Streams
      class StreamDetails
        include Extensions::Comparable
        extend Extensions::Creatable

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
