# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # Player.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#Player.Property.Name
      module PropertyName
        extend Extensions::Iterable

        AUDIO_STREAMS = 'audiostreams'
        CAN_CHANGE_SPEED = 'canchangespeed'
        CAN_MOVE = 'canmove'
        CAN_REPEAT = 'canrepeat'
        CAN_ROTATE = 'canrotate'
        CAN_SEEK = 'canseek'
        CAN_SHUFFLE = 'canshuffle'
        CAN_ZOOM = 'canzoom'
        CURRENT_AUDIO_STREAM = 'currentaudiostream'
        CURRENT_SUBTITLE = 'currentsubtitle'
        CURRENT_VIDEO_STREAM = 'currentvideostream'
        LIVE = 'live'
        PARTY_MODE = 'partymode'
        PERCENTAGE = 'percentage'
        PLAYLIST_ID = 'playlistid'
        POSITION = 'position'
        REPEAT = 'repeat'
        SHUFFLED = 'shuffled'
        SPEED = 'speed'
        SUBTITLE_ENABLED = 'subtitleenabled'
        SUBTITLES = 'subtitles'
        TIME = 'time'
        TOTAL_TIME = 'totaltime'
        TYPE = 'type'
        VIDEO_STREAMS = 'videostreams'
      end
    end
  end
end
