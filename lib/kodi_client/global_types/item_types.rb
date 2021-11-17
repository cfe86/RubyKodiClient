# frozen_string_literal: true

module KodiClient
  module Types
    module Items

      # Item.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Item.Details.Base
      module ItemDetailsBase

        attr_reader :label

        def item_details_base_by_hash(hash)
          item_details_base(hash['label'])
        end

        def item_details_base(label)
          @label = label
        end
      end
    end
  end
end
