# frozen_string_literal: true

require 'kodi_client/global_types/item_types'
require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'

module KodiClient
  module Types
    module Addons

      # Addon Types https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Types
      module AddonTypes
        extend Iterable

        UNKNOWN = 'unknown'
        KODI_ADSP = 'kodi.adsp'
        KODI_AUDIODECODER = 'kodi.audiodecoder'
        KODI_CONTEXT_ITEM = 'kodi.context.item'
        KODI_GAME_CONTROLLER = 'kodi.game.controller'
        KODI_INPUTSTREAM = 'kodi.inputstream'
        KODI_PERIPHERAL = 'kodi.peripheral'
        KODI_RESOURCE_IMAGES = 'kodi.resource.images'
        KODI_RESOURCE_LANGUAGE = 'kodi.resource.language'
        KODI_RESOURCE_UISOUNDS = 'kodi.resource.uisounds'
        XBMC_ADDON_AUDIO = 'xbmc.addon.audio'
        XBMC_ADDON_EXECUTABLE = 'xbmc.addon.executable'
        XBMC_ADDON_IMAGE = 'xbmc.addon.image'
        XBMC_ADDON_REPOSITORY = 'xbmc.addon.repository'
        XBMC_ADDON_VIDEO = 'xbmc.addon.video'
        XBMC_AUDIOENCODER = 'xbmc.audioencoder'
        XBMC_GUI_SKIN = 'xbmc.gui.skin'
        XBMC_METADATA_SCRAPER_ALBUMS = 'xbmc.metadata.scraper.albums'
        XBMC_METADATA_SCRAPER_ARTISTS = 'xbmc.metadata.scraper.artists'
        XBMC_METADATA_SCRAPER_LIBRARY = 'xbmc.metadata.scraper.library'
        XBMC_METADATA_SCRAPER_MOVIES = 'xbmc.metadata.scraper.movies'
        XBMC_METADATA_SCRAPER_MUSICVIDEOS = 'xbmc.metadata.scraper.musicvideos'
        XBMC_METADATA_SCRAPER_TVSHOWS = 'xbmc.metadata.scraper.episodes'
        XBMC_PLAYER_MUSICVIZ = 'xbmc.player.musicviz'
        XBMC_PVRCLIENT = 'xbmc.pvrclient'
        XBMC_PYTHON_LIBRARY = 'xbmc.python.library'
        XBMC_PYTHON_LYRICS = 'xbmc.python.lyrics'
        XBMC_PYTHON_MODULE = 'xbmc.python.module'
        XBMC_PYTHON_PLUGINSOURCE = 'xbmc.python.pluginsource'
        XBMC_PYTHON_SCRIPT = 'xbmc.python.script'
        XBMC_PYTHON_WEATHER = 'xbmc.python.weather'
        XBMC_SERVICE = 'xbmc.service'
        XBMC_SUBTITLE_MODULE = 'xbmc.subtitle.module'
        XBMC_UI_SCREENSAVER = 'xbmc.ui.screensaver'
        XBMC_WEBINTERFACE = 'xbmc.webinterface'
      end

      # Addon.Content https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Content
      module AddonContent
        extend Iterable

        UNKNOWN = 'unknown'
        AUDIO = 'audio'
        EXECUTABLE = 'executable'
        IMAGE = 'image'
        VIDEO = 'video'
      end

      # Addon.Fields https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Content
      module AddonFields
        extend Iterable

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

      # represents addon dependency
      class AddonDependency
        include Comparable
        extend Creatable

        attr_reader :addon_id, :optional, :version

        def initialize(addon_id, optional, version)
          @addon_id = addon_id
          @optional = optional
          @version = version
        end
      end

      # represents addon extra info
      class AddonExtraInfo
        include Comparable
        extend Creatable

        attr_reader :key, :value

        def initialize(key, value)
          @key = key
          @value = value
        end
      end

      # represents addon details
      class AddonDetails
        include Comparable
        include Items::ItemDetailsBase
        extend Creatable

        attr_reader :addon_id, :author, :broken, :dependencies, :description, :disclaimer, :enabled, :extra_info,
                    :fan_art, :installed, :name, :path, :rating, :summary, :thumbnail, :type, :version

        def self.create(hash)
          return nil if hash.nil?

          dependencies = AddonDependency.create_list(hash['dependencies'])
          extra_info = AddonExtraInfo.create_list(hash['extrainfo'])

          new(hash['addonid'], hash['author'], hash['broken'], dependencies, hash['description'], hash['disclaimer'],
              hash['enabled'], extra_info, hash['fanart'], hash['installed'], hash['name'], hash['path'],
              hash['rating'], hash['summary'], hash['thumbnail'], hash['type'], hash['version'],
              *hash_to_arr(hash, ['label']))
        end

        def initialize(addon_id, author, broken, dependencies, description, disclaimer, enabled, extra_info,
                       fan_art, installed, name, path, rating, summary, thumbnail, type, version, label)
          @addon_id = addon_id
          @author = author
          @broken = broken
          @dependencies = dependencies
          @description = description
          @disclaimer = disclaimer
          @enabled = enabled
          @extra_info = extra_info
          @fan_art = fan_art
          @installed = installed
          @name = name
          @path = path
          @rating = rating
          @summary = summary
          @thumbnail = thumbnail
          @type = type
          @version = version
          item_details_base(label)
        end
      end

      # getAddons return
      class Addons
        include Comparable

        attr_reader :addons, :limits

        def self.create(hash)
          return nil if hash.nil?

          addons = AddonDetails.create_list(hash['addons'])
          limits = List::ListLimitsReturned.create(hash['limits'])
          new(addons, limits)
        end

        def initialize(addons, limits)
          @addons = addons
          @limits = limits
        end
      end

      # getAddon return
      class Addon
        include Comparable

        attr_reader :addon

        def self.create(hash)
          return nil if hash.nil?

          new(AddonDetails.create(hash['addon']))
        end

        def initialize(addon)
          @addon = addon
        end
      end
    end
  end
end
