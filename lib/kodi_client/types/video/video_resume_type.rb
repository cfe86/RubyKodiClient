# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Resume https://kodi.wiki/view/JSON-RPC_API/v12#Video.Resume
      class VideoResume
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :position, :total

        def initialize(position, total)
          @position = position
          @total = total
        end
      end
    end
  end
end
