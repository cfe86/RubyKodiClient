# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Genres https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Genres
      class Genre
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :genre_id, :title

        def initialize(genre_id, title)
          @genre_id = genre_id
          @title = title
        end
      end
    end
  end
end
