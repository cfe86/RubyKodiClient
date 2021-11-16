# frozen_string_literal: true

require 'kodi_client/global_types/gui_types'
require 'kodi_client/kodi_module'
require 'kodi_client/global_types/input_types'

module KodiClient
  module Modules
    # contains all Kodi Input methods
    class Input < KodiModule

      BACK = 'Input.Back'
      CONTEXT_MENU = 'Input.ContextMenu'
      DOWN = 'Input.Down'
      EXECUTE_ACTION = 'Input.ExecuteAction'
      HOME = 'Input.Home'
      INFO = 'Input.Info'
      LEFT = 'Input.Left'
      RIGHT = 'Input.Right'
      SELECT = 'Input.Select'
      SEND_TEXT = 'Input.SendText'
      SHOW_CODEC = 'Input.ShowCodec'
      SHOW_OSD = 'Input.ShowOSD'
      SHOW_PLAYER_PROCESS_INFO = 'Input.ShowPlayerProcessInfo'
      UP = 'Input.Up'

      def back(kodi_id = 1)
        request = KodiRequest.new(kodi_id, BACK, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def context_menu(kodi_id = 1)
        request = KodiRequest.new(kodi_id, CONTEXT_MENU, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def down(kodi_id = 1)
        request = KodiRequest.new(kodi_id, DOWN, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def execute_action(action = Types::Input::InputAction::BACK, kodi_id = 1)
        request = KodiRequest.new(kodi_id, EXECUTE_ACTION, { 'action' => action })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def home(kodi_id = 1)
        request = KodiRequest.new(kodi_id, HOME, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def info(kodi_id = 1)
        request = KodiRequest.new(kodi_id, INFO, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def left(kodi_id = 1)
        request = KodiRequest.new(kodi_id, LEFT, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def right(kodi_id = 1)
        request = KodiRequest.new(kodi_id, RIGHT, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def select(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SELECT, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def send_text(text, done = true, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SEND_TEXT, { 'text' => text, 'done' => done})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def show_codec(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SHOW_CODEC, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def show_osd(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SHOW_OSD, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def show_player_process_info(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SHOW_PLAYER_PROCESS_INFO, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def up(kodi_id = 1)
        request = KodiRequest.new(kodi_id, UP, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
