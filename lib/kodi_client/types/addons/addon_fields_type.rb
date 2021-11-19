# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # Addon.Fields https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Content
      module AddonFields
        extend Extensions::Iterable

        AUTHOR = 'author'
        BROKEN = 'broken'
        DEPENDENCIES = 'dependencies'
        DESCRIPTION = 'description'
        DISCLAIMER = 'disclaimer'
        ENABLED = 'enabled'
        EXTRAINFO = 'extrainfo'
        FANART = 'fanart'
        INSTALLED = 'installed'
        NAME = 'name'
        PATH = 'path'
        RATING = 'rating'
        SUMMARY = 'summary'
        THUMBNAIL = 'thumbnail'
        VERSION = 'version'
      end
    end
  end
end
