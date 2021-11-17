# frozen_string_literal: true

require 'kodi_client/global_types/gui_types'
require 'kodi_client/kodi_module'

module KodiClient
  module Modules
    # contains all Kodi GUI methods
    class GUI < KodiModule

      ACTIVATE_WINDOW = 'GUI.ActivateWindow'
      GET_PROPERTIES = 'GUI.GetProperties'
      GET_STEREOSCOPIC_MODES = 'GUI.GetStereoscopicModes'
      SET_STEREOSCOPIC_MODES = 'GUI.SetStereoscopicMode'
      SET_FULLSCREEN = 'GUI.SetFullscreen'
      SHOW_NOTIFICATION = 'GUI.ShowNotification'

      def activate_window(window = Types::GUI::GUIWindow::HOME, parameters = [], kodi_id = 1)
        request = KodiRequest.new(kodi_id, ACTIVATE_WINDOW, { 'window' => window, 'parameters' => parameters })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_properties(properties = Types::GUI::PropertyName.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROPERTIES, { 'properties' => properties })
        json = invoke_api(request)
        result = KodiClient::Types::GUI::PropertyValue.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_stereoscopic_modes(kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_STEREOSCOPIC_MODES, {})
        json = invoke_api(request)
        result = Types::GUI::StereoscopyMode.create_list(json['result']['stereoscopicmodes'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def set_fullscreen(fullscreen = Types::Global::Toggle, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_FULLSCREEN, { 'fullscreen' => fullscreen })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_stereoscopic_mode(mode = Types::GUI::StereoscopyMode::OFF, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_STEREOSCOPIC_MODES, { 'mode' => mode })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def show_notification(title, message, image = '', display_time_in_ms = 5000, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SHOW_NOTIFICATION, { 'title' => title,
                                                                'message' => message,
                                                                'image' => image,
                                                                'displaytime' => display_time_in_ms })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
