# frozen_string_literal: true

require 'kodi_client/types/global_types'

module KodiClient
  module Types
    module GUI

      # GUI.Window https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Window
      module GUIWindow
        extend Iterable

        ACCESSPOINTS = 'accesspoints'
        ADDON = 'addon'
        ADDONBROWSER = 'addonbrowser'
        ADDONINFORMATION = 'addoninformation'
        ADDONSETTINGS = 'addonsettings'
        APPEARANCESETTINGS = 'appearancesettings'
        AUDIODSPMANAGER = 'audiodspmanager'
        BUSYDIALOG = 'busydialog'
        CONTENTSETTINGS = 'contentsettings'
        CONTEXTMENU = 'contextmenu'
        EVENTLOG = 'eventlog'
        EXTENDEDPROGRESSDIALOG = 'extendedprogressdialog'
        FAVOURITES = 'favourite'
        FILEBROWSER = 'filebrowser'
        FILEMANAGER = 'filemanager'
        FULLSCREENINFO = 'fullscreeninfo'
        FULLSCREENLIVETV = 'fullscreenlivetv'
        FULLSCREENRADIO = 'fullscreenradio'
        FULLSCREENVIDEO = 'fullscreenvideo'
        GAMECONTROLLERS = 'gamecontrollers'
        GAMEPADINPUT = 'gamepadinput'
        HOME = 'home'
        INTERFACESETTINGS = 'interfacesettings'
        LOCKSETTINGS = 'locksettings'
        LOGINSCREEN = 'loginscreen'
        MEDIAFILTER = 'mediafilter'
        MEDIASETTINGS = 'mediasettings'
        MEDIASOURCE = 'mediasource'
        MOVIEINFORMATION = 'movieinformation'
        MUSIC = 'music'
        MUSICINFORMATION = 'musicinformation'
        MUSICOSD = 'musicosd'
        MUSICPLAYLIST = 'musicplaylist'
        MUSICPLAYLISTEDITOR = 'musicplaylisteditor'
        NETWORKSETUP = 'networksetup'
        NOTIFICATION = 'notification'
        NUMERICINPUT = 'numericinput'
        OKDIALOG = 'okdialog'
        OSDAUDIODSPSETTINGS = 'osdaudiodspsettings'
        OSDAUDIOSETTINGS = 'osdaudiosettings'
        OSDCMSSETTINGS = 'osdcmssettings'
        OSDVIDEOSETTINGS = 'osdvideosettings'
        PERIPHERALSETTINGS = 'peripheralsettings'
        PICTUREINFO = 'pictureinfo'
        PICTURES = 'pictures'
        PLAYERCONTROLS = 'playercontrols'
        PLAYERPROCESSINFO = 'playerprocessinfo'
        PLAYERSETTINGS = 'playersettings'
        PROFILES = 'profiles'
        PROFILESETTINGS = 'profilesettings'
        PROGRAMS = 'programs'
        PROGRESSDIALOG = 'progressdialog'
        PVRCHANNELMANAGER = 'pvrchannelmanager'
        PVRCHANNELSCAN = 'pvrchannelscan'
        PVRGROUPMANAGER = 'pvrgroupmanager'
        PVRGUIDEINFO = 'pvrguideinfo'
        PVRGUIDESEARCH = 'pvrguidesearch'
        PVROSDCHANNELS = 'pvrosdchannels'
        PVROSDGUIDE = 'pvrosdguide'
        PVROSDTELETEXT = 'pvrosdteletext'
        PVRRADIORDSINFO = 'pvrradiordsinfo'
        PVRRECORDINGINFO = 'pvrrecordinginfo'
        PVRSETTINGS = 'pvrsettings'
        PVRTIMERSETTING = 'pvrtimersetting'
        PVRUPDATEPROGRESS = 'pvrupdateprogress'
        RADIOCHANNELS = 'radiochannels'
        RADIOGUIDE = 'radioguide'
        RADIORECORDINGS = 'radiorecordings'
        RADIOSEARCH = 'radiosearch'
        RADIOTIMERRULES = 'radiotimerrules'
        RADIOTIMERS = 'radiotimers'
        SCREENCALIBRATION = 'screencalibration'
        SCREENSAVER = 'screensaver'
        SEEKBAR = 'seekbar'
        SELECTDIALOG = 'selectdialog'
        SERVICESETTINGS = 'servicesettings'
        SETTINGS = 'settings'
        SHUTDOWNMENU = 'shutdownmenu'
        SKINSETTINGS = 'skinsettings'
        SLIDERDIALOG = 'sliderdialog'
        SLIDESHOW = 'slideshow'
        SMARTPLAYLISTEDITOR = 'smartplaylisteditor'
        SMARTPLAYLISTRULE = 'smartplaylistrule'
        SONGINFORMATION = 'songinformation'
        STARTUP = 'startup'
        STARTWINDOW = 'startwindow'
        SUBMENU = 'submenu'
        SUBTITLESEARCH = 'subtitlesearch'
        SYSTEMINFO = 'systeminfo'
        SYSTEMSETTINGS = 'systemsettings'
        TELETEXT = 'teletext'
        TESTPATTERN = 'testpattern'
        TEXTVIEWER = 'textviewer'
        TVCHANNELS = 'tvchannels'
        TVGUIDE = 'tvguide'
        TVRECORDINGS = 'tvrecordings'
        TVSEARCH = 'tvsearch'
        TVTIMERRULES = 'tvtimerrules'
        TVTIMERS = 'tvtimers'
        VIDEOBOOKMARKS = 'videobookmarks'
        VIDEOMENU = 'videomenu'
        VIDEOOSD = 'videoosd'
        VIDEOPLAYLIST = 'videoplaylist'
        VIDEOS = 'videos'
        VIDEOTIMESEEK = 'videotimeseek'
        VIRTUALKEYBOARD = 'virtualkeyboard'
        VISUALISATION = 'visualisation'
        VISUALISATIONPRESETLIST = 'visualisationpresetlist'
        VOLUMEBAR = 'volumebar'
        WEATHER = 'weather'
        YESNODIALOG = 'yesnodialog'
      end

      # GUI.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Property.Name
      module PropertyName
        extend Iterable

        CURRENTCONTROL = 'currentcontrol'
        CURRENTWINDOW = 'currentwindow'
        FULLSCREEN = 'fullscreen'
        SKIN = 'skin'
        STEREOSCOPICMODE = 'stereoscopicmode'
      end

      # GUI.Stereoscopy.Mode https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Stereoscopy.Mode
      class StereoscopyMode
        include Comparable
        include Iterable
        extend Creatable

        attr_reader :label, :mode

        OFF = 'off'
        SPLIT_VERTICAL = 'split_vertical'
        SPLIT_HORIZONTAL = 'split_horizontal'
        ROW_INTERLEAVED = 'row_interleaved'
        HARDWARE_BASED = 'hardware_based'
        ANAGLYPH_CYAN_RED = 'anaglyph_cyan_red'
        ANAGLYPH_GREEN_MAGENTA = 'anaglyph_green_magenta'
        ANAGLYPH_YELLOW_BLUE = 'anaglyph_yellow_blue'
        MONSCOPIC = 'monoscopic'

        def initialize(label, mode)
          @label = label
          @mode = mode
        end
      end

      # GUI.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Property.Value
      class PropertyValue
        include Comparable
        extend Creatable

        attr_reader :current_control, :current_window, :fullscreen, :skin, :stereoscopic_mode

        type_mapping ['currentcontrol', Global::IdLabel], ['currentwindow', Global::IdLabel],
                     ['skin', Global::IdName], ['stereoscopicmode', StereoscopyMode]

        def initialize(current_control, current_window, fullscreen, skin, stereoscopic_mode)
          @current_control = current_control
          @current_window = current_window
          @fullscreen = fullscreen
          @skin = skin
          @stereoscopic_mode = stereoscopic_mode
        end
      end
    end
  end
end
