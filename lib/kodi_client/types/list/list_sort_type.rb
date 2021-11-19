# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Sort https://kodi.wiki/view/JSON-RPC_API/v12#List.Sort
      class ListSort
        include Extensions::Comparable

        attr_reader :ignore_article, :method, :order, :use_artist_sort_name

        def initialize(ignore_article = false, method = ListSortMethod::NONE,
                       sort_order = SortOrder::ASCENDING, use_artist_sort_name = false)
          @ignore_article = ignore_article
          @method = method
          @order = sort_order
          @use_artist_sort_name = use_artist_sort_name
        end
      end
    end
  end
end
