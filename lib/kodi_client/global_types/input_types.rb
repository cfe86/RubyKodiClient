# frozen_string_literal: true

require 'kodi_client/util/iterable'

module KodiClient
  module Types
    module Input

      # Input.Action https://kodi.wiki/view/JSON-RPC_API/v12#Input.Action
      module InputAction
        include Iterable

        ANALOGFASTFORWARD = 'analogfastforward'
        ANALOGMOVE = 'analogmove'
        ANALOGMOVEX = 'analogmovex'
        ANALOGMOVEY = 'analogmovey'
        ANALOGREWIND = 'analogrewind'
        ANALOGSEEKBACK = 'analogseekback'
        ANALOGSEEKFORWARD = 'analogseekforward'
        ASPECTRATIO = 'aspectratio'
        AUDIODELAY = 'audiodelay'
        AUDIODELAYMINUS = 'audiodelayminus'
        AUDIODELAYPLUS = 'audiodelayplus'
        AUDIONEXTLANGUAGE = 'audionextlanguage'
        AUDIOTOGGLEDIGITAL = 'audiotoggledigital'
        BACK = 'back'
        BACKSPACE = 'backspace'
        BIGSTEPBACK = 'bigstepback'
        BIGSTEPFORWARD = 'bigstepforward'
        BLUE = 'blue'
        CHANNELDOWN = 'channeldown'
        CHANNELUP = 'channelup'
        CHAPTERORBIGSTEPBACK = 'chapterorbigstepback'
        CHAPTERORBIGSTEPFORWARD = 'chapterorbigstepforward'
        CLOSE = 'close'
        CODECINFO = 'codecinfo'
        CONTEXTMENU = 'contextmenu'
        COPY = 'copy'
        CREATEBOOKMARK = 'createbookmark'
        CREATEEPISODEBOOKMARK = 'createepisodebookmark'
        CURSORLEFT = 'cursorleft'
        CURSORRIGHT = 'cursorright'
        CYCLESUBTITLE = 'cyclesubtitle'
        DECREASEPAR = 'decreasepar'
        DECREASERATING = 'decreaserating'
        DECREASEVISRATING = 'decreasevisrating'
        DELETE = 'delete'
        DOUBLECLICK = 'doubleclick'
        DOWN = 'down'
        ENTER = 'enter'
        ERROR = 'error'
        FASTFORWARD = 'fastforward'
        FILTER = 'filter'
        FILTERCLEAR = 'filterclear'
        FILTERSMS2 = 'filtersms2'
        FILTERSMS3 = 'filtersms3'
        FILTERSMS4 = 'filtersms4'
        FILTERSMS5 = 'filtersms5'
        FILTERSMS6 = 'filtersms6'
        FILTERSMS7 = 'filtersms7'
        FILTERSMS8 = 'filtersms8'
        FILTERSMS9 = 'filtersms9'
        FIRSTPAGE = 'firstpage'
        FULLSCREEN = 'fullscreen'
        GREEN = 'green'
        GUIPROFILE = 'guiprofile'
        HIGHLIGHT = 'highlight'
        INCREASEPAR = 'increasepar'
        INCREASERATING = 'increaserating'
        INCREASEVISRATING = 'increasevisrating'
        INFO = 'info'
        JUMPSMS2 = 'jumpsms2'
        JUMPSMS3 = 'jumpsms3'
        JUMPSMS4 = 'jumpsms4'
        JUMPSMS5 = 'jumpsms5'
        JUMPSMS6 = 'jumpsms6'
        JUMPSMS7 = 'jumpsms7'
        JUMPSMS8 = 'jumpsms8'
        JUMPSMS9 = 'jumpsms9'
        LASTPAGE = 'lastpage'
        LEFT = 'left'
        LEFTCLICK = 'leftclick'
        LOCKPRESET = 'lockpreset'
        LONGCLICK = 'longclick'
        LONGPRESS = 'longpress'
        MENU = 'menu'
        MIDDLECLICK = 'middleclick'
        MOUSEDRAG = 'mousedrag'
        MOUSEMOVE = 'mousemove'
        MOVE = 'move'
        MOVEITEMDOWN = 'moveitemdown'
        MOVEITEMUP = 'moveitemup'
        MUTE = 'mute'
        NEXTCALIBRATION = 'nextcalibration'
        NEXTCHANNELGROUP = 'nextchannelgroup'
        NEXTLETTER = 'nextletter'
        NEXTPICTURE = 'nextpicture'
        NEXTPRESET = 'nextpreset'
        NEXTRESOLUTION = 'nextresolution'
        NEXTSCENE = 'nextscene'
        NEXTSTEREOMODE = 'nextstereomode'
        NEXTSUBTITLE = 'nextsubtitle'
        NOOP = 'noop'
        NUMBER0 = 'number0'
        NUMBER1 = 'number1'
        NUMBER2 = 'number2'
        NUMBER3 = 'number3'
        NUMBER4 = 'number4'
        NUMBER5 = 'number5'
        NUMBER6 = 'number6'
        NUMBER7 = 'number7'
        NUMBER8 = 'number8'
        NUMBER9 = 'number9'
        OSD = 'osd'
        PAGEDOWN = 'pagedown'
        PAGEUP = 'pageup'
        PANGESTURE = 'pangesture'
        PARENTDIR = 'parentdir'
        PARENTFOLDER = 'parentfolder'
        PAUSE = 'pause'
        PLAY = 'play'
        PLAYERDEBUG = 'playerdebug'
        PLAYERPROCESSINFO = 'playerprocessinfo'
        PLAYLIST = 'playlist'
        PLAYPAUSE = 'playpause'
        PLAYPVR = 'playpvr'
        PLAYPVRRADIO = 'playpvrradio'
        PLAYPVRTV = 'playpvrtv'
        PREVIOUSCHANNELGROUP = 'previouschannelgroup'
        PREVIOUSMENU = 'previousmenu'
        PREVIOUSPICTURE = 'previouspicture'
        PREVIOUSPRESET = 'previouspreset'
        PREVIOUSSCENE = 'previousscene'
        PREVIOUSSTEREOMODE = 'previousstereomode'
        PREVLETTER = 'prevletter'
        QUEUE = 'queue'
        RANDOMPRESET = 'randompreset'
        RECORD = 'record'
        RED = 'red'
        RELOADKEYMAPS = 'reloadkeymaps'
        RENAME = 'rename'
        RESETCALIBRATION = 'resetcalibration'
        REWIND = 'rewind'
        RIGHT = 'right'
        RIGHTCLICK = 'rightclick'
        ROTATE = 'rotate'
        ROTATECCW = 'rotateccw'
        ROTATEGESTURE = 'rotategesture'
        SCANITEM = 'scanitem'
        SCREENSHOT = 'screenshot'
        SCROLLDOWN = 'scrolldown'
        SCROLLUP = 'scrollup'
        SELECT = 'select'
        SETRATING = 'setrating'
        SETTINGSLEVELCHANGE = 'settingslevelchange'
        SETTINGSRESET = 'settingsreset'
        SHIFT = 'shift'
        SHOWPRESET = 'showpreset'
        SHOWSUBTITLES = 'showsubtitles'
        SHOWTIME = 'showtime'
        SHOWTIMERRULE = 'showtimerrule'
        SHOWVIDEOMENU = 'showvideomenu'
        SKIPNEXT = 'skipnext'
        SKIPPREVIOUS = 'skipprevious'
        SMALLSTEPBACK = 'smallstepback'
        STEPBACK = 'stepback'
        STEPFORWARD = 'stepforward'
        STEREOMODE = 'stereomode'
        STEREOMODETOMONO = 'stereomodetomono'
        STOP = 'stop'
        SUBTITLEALIGN = 'subtitlealign'
        SUBTITLEDELAY = 'subtitledelay'
        SUBTITLEDELAYMINUS = 'subtitledelayminus'
        SUBTITLEDELAYPLUS = 'subtitledelayplus'
        SUBTITLESHIFTDOWN = 'subtitleshiftdown'
        SUBTITLESHIFTUP = 'subtitleshiftup'
        SWIPEDOWN = 'swipedown'
        SWIPELEFT = 'swipeleft'
        SWIPERIGHT = 'swiperight'
        SWIPEUP = 'swipeup'
        SWITCHPLAYER = 'switchplayer'
        SYMBOLS = 'symbols'
        TAP = 'tap'
        TOGGLECOMMSKIP = 'togglecommskip'
        TOGGLEFULLSCREEN = 'togglefullscreen'
        TOGGLESTEREOMODE = 'togglestereomode'
        TOGGLEWATCHED = 'togglewatched'
        UP = 'up'
        VERTICALSHIFTDOWN = 'verticalshiftdown'
        VERTICALSHIFTUP = 'verticalshiftup'
        VOLAMPDOWN = 'volampdown'
        VOLAMPUP = 'volampup'
        VOLUMEAMPLIFICATION = 'volumeamplification'
        VOLUMEDOWN = 'volumedown'
        VOLUMEUP = 'volumeup'
        WHEELDOWN = 'wheeldown'
        WHEELUP = 'wheelup'
        YELLOW = 'yellow'
        ZOOMGESTURE = 'zoomgesture'
        ZOOMIN = 'zoomin'
        ZOOMLEVEL1 = 'zoomlevel1'
        ZOOMLEVEL2 = 'zoomlevel2'
        ZOOMLEVEL3 = 'zoomlevel3'
        ZOOMLEVEL4 = 'zoomlevel4'
        ZOOMLEVEL5 = 'zoomlevel5'
        ZOOMLEVEL6 = 'zoomlevel6'
        ZOOMLEVEL7 = 'zoomlevel7'
        ZOOMLEVEL8 = 'zoomlevel8'
        ZOOMLEVEL9 = 'zoomlevel9'
        ZOOMNORMAL = 'zoomnormal'
        ZOOMOUT = 'zoomout'
      end
    end
  end
end
