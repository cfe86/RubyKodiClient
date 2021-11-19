# frozen_string_literal: true

module KodiClient
  module Types
    module Video
      # Video.Cast https://kodi.wiki/view/JSON-RPC_API/v12#Video.Cast
      class VideoCast
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :name, :order, :role, :thumbnail

        def initialize(name, order, role, thumbnail)
          @name = name
          @order = order
          @role = role
          @thumbnail = thumbnail
        end
      end
    end
  end
end
