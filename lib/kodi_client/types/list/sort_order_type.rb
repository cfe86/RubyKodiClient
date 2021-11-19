# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # ascending/descending for sorting https://kodi.wiki/view/JSON-RPC_API/v12#List.Sort
      module SortOrder
        extend Extensions::Iterable

        ASCENDING = 'ascending'
        DESCENDING = 'descending'
      end
    end
  end
end
