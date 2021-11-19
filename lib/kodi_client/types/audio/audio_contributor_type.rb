# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Contributor https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Contributors
      class AudioContributor
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :artist_id, :name, :role, :role_id

        def initialize(artist_id, name, role, role_id)
          @artist_id = artist_id
          @name = name
          @role = role
          @role_id = role_id
        end
      end
    end
  end
end
