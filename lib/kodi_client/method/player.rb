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
    end
  end
end

# client = KodiClient.connect('10.88.111.7', 8080).auth('kodi', 'pw')
# a = client.player
# a.player_open('http://10.88.111.7:1238/%25/2734c6a5037a2c2cafb3b3c184e1ee6f/Breaking%2520Bad%2520-%2520S01E01%2520-%2520Pilot.mkv')
# c = a.get_view_mode
# puts c