# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # AudioLibrary.GetAvailableArt https://kodi.wiki/view/JSON-RPC_API/v12#AudioLibrary.GetAvailableArt
      class AvailableArt
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :art_type, :preview_url, :url

        def initialize(art_type, preview_url, url)
          @art_type = art_type
          @preview_url = preview_url
          @url = url
        end
      end
    end
  end
end
