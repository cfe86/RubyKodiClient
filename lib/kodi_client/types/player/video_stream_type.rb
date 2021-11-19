# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Video.Stream https://kodi.wiki/view/JSON-RPC_API/v12#Player.Video.Stream
      class VideoStream
        include Extensions::Comparable
        extend Extensions::Creatable

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
    end
  end
end
