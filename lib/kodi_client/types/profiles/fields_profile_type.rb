# frozen_string_literal: true

module KodiClient
  module Types
    module Profiles
      # Profiles.Fields.Profile https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Fields.Profile
      module FieldsProfile
        extend Extensions::Iterable

        LOCK_MODE = 'lockmode'
        THUMBNAIL = 'thumbnail'
      end
    end
  end
end
