# frozen_string_literal: true

module KodiClient
  module Types
    module Library
      # Library.Details.Source https://kodi.wiki/view/JSON-RPC_API/v12#Library.Details.Source
      class AudioDetailsSource
        include Items::ItemDetailsBase
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :file, :paths, :source_id

        fields_to_map %w[file paths source_id label]

        def initialize(file, paths, source_id, label)
          @file = file
          @paths = paths
          @source_id = source_id
          item_details_base(label)
        end
      end
    end
  end
end

