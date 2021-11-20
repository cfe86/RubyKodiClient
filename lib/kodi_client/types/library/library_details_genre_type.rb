# frozen_string_literal: true

module KodiClient
  module Types
    module Library
      # Library.Details.Genre https://kodi.wiki/view/JSON-RPC_API/v12#Library.Details.Genre
      class LibraryDetailsGenre
        include Items::ItemDetailsBase
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :title, :thumbnail, :source_id

        fields_to_map %w[genre_id source_id thumbnail title label]

        def initialize(genre_id, source_id, thumbnail, title, label)
          @genre_id = genre_id
          @title = title
          @thumbnail = thumbnail
          @source_id = source_id
          item_details_base(label)
        end
      end
    end
  end
end

