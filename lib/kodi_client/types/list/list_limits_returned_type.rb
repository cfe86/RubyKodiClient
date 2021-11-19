# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.LimitsReturned https://kodi.wiki/view/JSON-RPC_API/v12#List.LimitsReturned
      class ListLimitsReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :list_start, :list_end, :total

        fields_to_map %w[start end total]

        def initialize(list_start, list_end, total)
          @list_start = list_start
          @list_end = list_end
          @total = total
        end
      end
    end
  end
end
