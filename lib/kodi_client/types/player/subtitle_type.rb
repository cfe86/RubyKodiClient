# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player Subtitle https://kodi.wiki/view/JSON-RPC_API/v12#Player.Subtitle
      class Subtitle
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :index, :is_default, :is_forced, :is_impaired, :language, :name

        def initialize(index, is_default, is_forced, is_impaired, language, name)
          @index = index
          @is_default = is_default
          @is_forced = is_forced
          @is_impaired = is_impaired
          @language = language
          @name = name
        end
      end
    end
  end
end
