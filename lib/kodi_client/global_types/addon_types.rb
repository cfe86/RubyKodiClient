# frozen_string_literal: true

require_relative 'item_types'
require_relative '../util/comparable'
require_relative '../util/iterable'

module KodiClient
  module Types
    module Addons

      # Addon Types https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Types
      module AddonTypes
        include Iterable

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
        include Iterable
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

        attr_reader :addonid, :optional, :version

        def initialize(hash)
          @addonid = hash['addonid']
          @optional = hash['optional']
          @version = hash['version']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # represents addon extra info
      class AddonExtraInfo
        include Comparable

        attr_reader :key, :value

        def initialize(hash)
          @key = hash['key']
          @value = hash['value']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # represents addon details
      class AddonDetails
        include Comparable
        include Items::ItemDetailsBase

        attr_reader :addon_id, :author, :broken, :dependencies, :description, :disclaimer, :enabled, :extra_info,
                    :fan_art, :installed, :name, :path, :rating, :summary, :thumbnail, :type, :version

        def initialize(hash)
          @addon_id = hash['addonid']
          @author = hash['author']
          @broken = hash['broken']
          @dependencies = hash['dependencies'].nil? ? nil : hash['dependencies'].map { |it| AddonDependency.new(it) }
          @description = hash['description']
          @disclaimer = hash['disclaimer']
          @enabled = hash['enabled']
          @extra_info = hash['extrainfo'].nil? ? nil : hash['extrainfo'].map { |it| AddonExtraInfo.new(it) }
          @fan_art = hash['fanart']
          @installed = hash['installed']
          @name = hash['name']
          @path = hash['path']
          @rating = hash['rating']
          @summary = hash['summary']
          @thumbnail = hash['thumbnail']
          @type = hash['type']
          @version = hash['version']
          item_details_base(hash)
        end

        def ==(other)
          compare(self, other)
        end
      end

      # getAddons return
      class Addons
        include Comparable

        attr_reader :addons, :limits

        def initialize(hash)
          @addons = hash['addons'].map { |it| AddonDetails.new(it) }
          @limits = List::ListLimitsReturned.new(hash['limits'])
        end

        def ==(other)
          compare(self, other)
        end
      end

      # getAddon return
      class Addon
        include Comparable

        attr_reader :addon

        def initialize(hash)
          @addon = AddonDetails.new(hash['addon'])
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
