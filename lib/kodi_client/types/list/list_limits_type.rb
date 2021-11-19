# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Limits https://kodi.wiki/view/JSON-RPC_API/v12#List.Limits
      class ListLimits
        include Extensions::Comparable

        attr_reader :list_start, :list_end

        def initialize(list_start, list_end)
          @list_start = list_start
          @list_end = list_end
        end
      end
    end
  end
end
