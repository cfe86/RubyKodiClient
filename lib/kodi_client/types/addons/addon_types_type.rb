# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # Addon Types https://kodi.wiki/view/JSON-RPC_API/v12#Addon.Types
      module AddonTypes
        extend Extensions::Iterable

        UNKNOWN = 'unknown'
        KODI_ADSP = 'kodi.adsp'
        KODI_AUDIO_DECODER = 'kodi.audiodecoder'
        KODI_CONTEXT_ITEM = 'kodi.context.item'
        KODI_GAME_CONTROLLER = 'kodi.game.controller'
        KODI_INPUT_STREAM = 'kodi.inputstream'
        KODI_PERIPHERAL = 'kodi.peripheral'
        KODI_RESOURCE_IMAGES = 'kodi.resource.images'
        KODI_RESOURCE_LANGUAGE = 'kodi.resource.language'
        KODI_RESOURCE_UI_SOUNDS = 'kodi.resource.uisounds'
        XBMC_ADDON_AUDIO = 'xbmc.addon.audio'
        XBMC_ADDON_EXECUTABLE = 'xbmc.addon.executable'
        XBMC_ADDON_IMAGE = 'xbmc.addon.image'
        XBMC_ADDON_REPOSITORY = 'xbmc.addon.repository'
        XBMC_ADDON_VIDEO = 'xbmc.addon.video'
        XBMC_AUDIO_ENCODER = 'xbmc.audioencoder'
        XBMC_GUI_SKIN = 'xbmc.gui.skin'
        XBMC_METADATA_SCRAPER_ALBUMS = 'xbmc.metadata.scraper.albums'
        XBMC_METADATA_SCRAPER_ARTISTS = 'xbmc.metadata.scraper.artists'
        XBMC_METADATA_SCRAPER_LIBRARY = 'xbmc.metadata.scraper.library'
        XBMC_METADATA_SCRAPER_MOVIES = 'xbmc.metadata.scraper.movies'
        XBMC_METADATA_SCRAPER_MUSIC_VIDEOS = 'xbmc.metadata.scraper.musicvideos'
        XBMC_METADATA_SCRAPER_TV_SHOWS = 'xbmc.metadata.scraper.episodes'
        XBMC_PLAYER_MUSIC_VIZ = 'xbmc.player.musicviz'
        XBMC_PVR_CLIENT = 'xbmc.pvrclient'
        XBMC_PYTHON_LIBRARY = 'xbmc.python.library'
        XBMC_PYTHON_LYRICS = 'xbmc.python.lyrics'
        XBMC_PYTHON_MODULE = 'xbmc.python.module'
        XBMC_PYTHON_PLUGIN_SOURCE = 'xbmc.python.pluginsource'
        XBMC_PYTHON_SCRIPT = 'xbmc.python.script'
        XBMC_PYTHON_WEATHER = 'xbmc.python.weather'
        XBMC_SERVICE = 'xbmc.service'
        XBMC_SUBTITLE_MODULE = 'xbmc.subtitle.module'
        XBMC_UI_SCREENSAVER = 'xbmc.ui.screensaver'
        XBMC_WEBINTERFACE = 'xbmc.webinterface'
      end
    end
  end
end
