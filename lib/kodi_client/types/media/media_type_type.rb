# frozen_string_literal: true

module KodiClient
  module Types
    module Media
      # media types
      module MediaType
        extend Extensions::Iterable

        VIDEO = 'video'
        AUDIO = 'audio'
        ALL = 'all'
      end
    end
  end
end
