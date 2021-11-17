# frozen_string_literal: true

require 'kodi_client/global_types/item_types'
require 'kodi_client/util/comparable'
require 'kodi_client/util/creatable'

module KodiClient
  module Types
    module Media

      # media types
      module MediaType
        extend Iterable

        VIDEO = 'video'
        AUDIO = 'audio'
        ALL = 'all'
      end

      # Media.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Media.Details.Base
      module MediaDetailsBase
        include Items::ItemDetailsBase

        attr_reader :fan_art, :thumbnail

        def media_details_base_by_hash(hash)
          @fan_art = hash['fanart']
          @thumbnail = hash['thumbnail']
          item_details_base_by_hash(hash)
        end

        def media_details_base(fan_art, thumbnail, label)
          @fan_art = fan_art
          @thumbnail = thumbnail
          item_details_base(label)
        end
      end

      # Media.Artwork https://kodi.wiki/view/JSON-RPC_API/v12#Media.Artwork
      class MediaArtwork
        include Comparable
        extend Creatable

        attr_reader :banner, :fan_art, :poster, :thumb

        def initialize(banner, fan_art, poster, thumb)
          @banner = banner
          @fan_art = fan_art
          @poster = poster
          @thumb = thumb
        end
      end
    end
  end
end
