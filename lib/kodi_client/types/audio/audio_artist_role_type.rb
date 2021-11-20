# frozen_string_literal: true

module KodiClient
  module Types
    module Audio

      # Audio.Artist.Roles https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Artist.Roles
      class AudioArtistRole
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :role, :role_id

        def initialize(role, role_id)
          @role = role
          @role_id = role_id
        end
      end
    end
  end
end
