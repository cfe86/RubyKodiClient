# frozen_string_literal: true

require_relative 'item_types'
require_relative '../util/comparable'

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

        def media_details_base(hash)
          @fan_art = hash['fanart']
          @thumbnail = hash['thumbnail']
          item_details_base(hash)
        end
      end

      # Media.Artwork https://kodi.wiki/view/JSON-RPC_API/v12#Media.Artwork
      class MediaArtwork
        include Comparable

        attr_reader :banner, :fan_art, :poster, :thumb

        def initialize(hash)
          @banner = hash['banner']
          @fan_art = hash['fanart']
          @poster = hash['poster']
          @thumb = hash['thumb']
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
