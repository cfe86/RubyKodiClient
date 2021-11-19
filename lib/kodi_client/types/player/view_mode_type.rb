# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.ViewMode https://kodi.wiki/view/JSON-RPC_API/v12#Player.ViewMode
      module ViewMode
        extend Extensions::Iterable

        NORMAL = 'normal'
        ZOOM = 'zoom'
        STRETCH_4X3 = 'strech4x3'
        WIDE_ZOOM = 'widezoom'
        STRETCH_16X9 = 'stretch16x9'
        ORIGINAL = 'original'
        STRETCH_16X9_NONLIN = 'stretch16x9nonline'
        ZOOM_120_WIDTH = 'zoom120width'
        ZOOM_110_WIDTH = 'zoom110width'
      end
    end
  end
end
