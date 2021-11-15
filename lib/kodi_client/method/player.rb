# frozen_string_literal: true

require 'kodi_client/kodi_module'
require 'kodi_client/global_types/addon_types'
require 'kodi_client/global_types/list_types'
require 'kodi_client/global_types/player_type'

module KodiClient
  module Modules
    # contains all Kodi Application methods
    class Player < KodiModule

      ADD_SUBTITLE = 'Player.AddSubtitle'
      OPEN = 'Player.Open'
      GET_ACTIVE_PLAYER = 'Player.GetActivePlayers'
      GET_ITEM = 'Player.GetItem'
      GET_PLAYERS = 'Player.GetPlayers'
      GET_PROPERTIES = 'Player.GetProperties'
      GET_VIEW_MODE = 'Player.GetViewMode'
      GO_TO = 'Player.GoTo'
      MOVE = 'Player.Move'
      ROTATE = 'Player.Rotate'
      PLAY_PAUSE = 'Player.PlayPause'
      SEEK = 'Player.Seek'
      SET_AUDIO_STREAM = 'Player.SetAudioStream'
      SET_PARTY_MODE = 'Player.SetPartymode'
      SET_REPEAT = 'Player.SetRepeat'
      SET_SPEED = 'Player.SetSpeed'
      SET_SUBTITLE = 'Player.SetSubtitle'
      SET_VIDEO_STREAM = 'Player.SetVideoStream'
      SET_VIEW_MODE = 'Player.SetViewMode'
      STOP = 'Player.Stop'
      ZOOM = 'Player.Zoom'

      def add_subtitle(player_id, subtitle, kodi_id = 1)
        request = KodiRequest.new(kodi_id, ADD_SUBTITLE, { 'playerid' => player_id, 'subtitle' => subtitle })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_active_players(kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ACTIVE_PLAYER, {})
        json = invoke_api(request)
        result = json['result'].nil? ? nil : json['result'].map { |it| Types::Player::Player.new(it) }
        json['result'] = result
        KodiResponse.new(json)
      end

      # local file or stream url
      def player_open(file, options = {}, kodi_id = 1)
        request = KodiRequest.new(kodi_id, OPEN, { 'item' => { 'file' => file }, 'options' => options })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_item(player_id, properties = Types::List::ListFieldsAll.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ITEM, { 'playerid' => player_id,
                                                       'properties' => properties })
        json = invoke_api(request)
        result = Types::List::ListItemAll.new(json['result']['item'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_players(media = Types::Media::MediaType::ALL, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PLAYERS, { 'media' => media })
        json = invoke_api(request)
        result = json['result'].map { |it| Types::Player::Player.new(it) }
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_properties(player_id, properties = Types::Player::PropertyName.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROPERTIES, { 'playerid' => player_id,
                                                             'properties' => properties })
        json = invoke_api(request)
        result = Types::Player::PropertyValue.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_view_mode(kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_VIEW_MODE, {})
        json = invoke_api(request)
        result = Types::Player::PlayerViewMode.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      # goes to the next/prev item or to a specific item in the playlist
      #
      # @param [String] player_id - the player id
      # @param [Integer/Types::Global::NextPrev] to - playlist position, or prev/next
      # @param [Integer] kodi_id - the kodi id
      #
      # @return [KodiResponse] - OK or Error
      def go_to(player_id, to = Types::Global::NextPrev::NEXT, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GO_TO, { 'playerid' => player_id, 'to' => to })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def move(player_id, direction = Types::Global::Direction::UP, kodi_id = 1)
        request = KodiRequest.new(kodi_id, MOVE, { 'playerid' => player_id, 'direction' => direction })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def rotate(player_id, rotate = Types::Global::Rotate::CLOCKWISE, kodi_id = 1)
        request = KodiRequest.new(kodi_id, ROTATE, { 'playerid' => player_id, 'value' => rotate })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def play_pause(player_id, play = Types::Global::Toggle::TOGGLE, kodi_id = 1)
        request = KodiRequest.new(kodi_id, PLAY_PAUSE, { 'playerid' => player_id, 'play' => play })
        json = invoke_api(request)
        result = json['result']['speed']
        json['result'] = result
        KodiResponse.new(json)
      end

      # seeks to the given position
      #
      # @param [Integer] player_id - the player id
      # @param [Float/PlayerPositionTime/PlayerSeekJump/Integer] value - the seek value in either Percentage,
      #                                                                  PositionTime, Jump or seek by seconds
      #
      # return [KodiResponse] - return percentage, time and total time
      def seek(player_id, value, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SEEK, { 'playerid' => player_id, 'value' => value })
        json = invoke_api(request)
        result = Types::Player::SeekReturnValue.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      # sets the given audio stream
      #
      # @param [Integer, Next/Prev] stream - the stream to set, can either be the index or next/prev
      #
      # return [KodiResponse] 'OK' or error
      def set_audio_stream(player_id, stream, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_AUDIO_STREAM, { 'playerid' => player_id, 'stream' => stream })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_party_mode(player_id, mode = Types::Global::Toggle::TOGGLE, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_PARTY_MODE, { 'playerid' => player_id, 'partymode' => mode })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_repeat(player_id, repeat = Types::Player::PlayerRepeat::ALL, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_REPEAT, { 'playerid' => player_id, 'repeat' => repeat })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_speed(player_id, speed = Types::Global::IncrementDecrement::INCREMENT, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_SPEED, { 'playerid' => player_id, 'speed' => speed })
        json = invoke_api(request)
        result = json['result']['speed']
        json['result'] = result
        KodiResponse.new(json)
      end

      # sets the subtitle
      #
      # @param [Integer] player_id - the player id
      # @param [Next|Prev/Integer] subtitle - the subtitle to set. Can either be an index or next/prev
      # @param [Boolean] enabled - true if the set subtitle should be enabled, else false
      #
      # @return [KodiResponse] - 'OK' else error
      def set_subtitle(player_id, subtitle = Types::Global::NextPrev::NEXT, enabled = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_SUBTITLE, { 'playerid' => player_id, 'subtitle' => subtitle,
                                                           'enabled' => enabled })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      # Sets the video stream
      #
      # @param [Integer] player_id - the player id
      # @param [Next|Prev/Integer] stream - the stream to set. Can either be an index or next/prev
      #
      # @return [KodiResponse] - 'OK' else error
      def set_video_stream(player_id, stream = Types::Global::NextPrev::NEXT, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_VIDEO_STREAM, { 'playerid' => player_id, 'stream' => stream })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_view_mode(player_id, mode = Types::Player::ViewMode::NORMAL, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_VIEW_MODE, { 'playerid' => player_id, 'viewmode' => mode })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def stop(player_id, kodi_id = 1)
        request = KodiRequest.new(kodi_id, STOP, { 'playerid' => player_id })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      # Sets the zoom
      #
      # @param [Integer] player_id - the player id
      # @param [Zoom/Integer] zoom - Can either be 1-10 or step In/Out
      #
      # @return [KodiResponse] - 'OK' else error
      def zoom(player_id, zoom, kodi_id = 1)
        request = KodiRequest.new(kodi_id, ZOOM, { 'playerid' => player_id, 'zoom' => zoom })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end

# client = KodiClient.connect('10.88.111.7', 8080).auth('kodi', 'pw')
# a = client.player
# a.player_open('http://10.88.111.7:1238/%25/2734c6a5037a2c2cafb3b3c184e1ee6f/Breaking%2520Bad%2520-%2520S01E01%2520-%2520Pilot.mkv')
# c = a.get_view_mode
# puts c