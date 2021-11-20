# frozen_string_literal: true

module KodiClient
  module Types
    module Media
      # Media.Artwork https://kodi.wiki/view/JSON-RPC_API/v12#Media.Artwork
      class MediaArtwork
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :banner, :fan_art, :poster, :thumb

        def initialize(banner, fan_art, poster, thumb)
          @banner = banner
          @fan_art = fan_art
          @poster = poster
          @thumb = thumb
        end

        def to_h
          { 'banner' => @banner, 'fanart' => @fan_art, 'poster' => @poster, 'thumb' => @thumb }
        end
      end
    end
  end
end
