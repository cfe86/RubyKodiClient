# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # Addon.Content https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Content
      module AddonContent
        extend Extensions::Iterable

        UNKNOWN = 'unknown'
        AUDIO = 'audio'
        EXECUTABLE = 'executable'
        IMAGE = 'image'
        VIDEO = 'video'
      end
    end
  end
end
