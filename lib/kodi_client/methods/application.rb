# frozen_string_literal: true

module KodiClient
  module Methods
    # contains all Kodi Application methods
    class Application < KodiMethod

      QUIT = 'Application.Quit'
      SET_MUTE = 'Application.SetMute'
      SET_VOLUME = 'Application.SetVolume'
      GET_PROPERTIES = 'Application.GetProperties'

      def quit(kodi_id = 1)
        request = KodiRequest.new(kodi_id, QUIT)
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def mute(kodi_id = 1, mute_state: Types::Global::Toggle::TOGGLE)
        request = KodiRequest.new(kodi_id, SET_MUTE, { 'mute' => mute_state })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_properties(properties = Types::Application::PropertyName.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROPERTIES, { 'properties' => properties })
        json = invoke_api(request)
        result = Types::Application::PropertyValue.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def set_volume(volume, kodi_id = 1)
        set_volume_incr_decr_vol(volume, kodi_id)
      end

      def increment_volume(kodi_id = 1)
        set_volume_incr_decr_vol(Types::Global::IncrementDecrement::INCREMENT, kodi_id)
      end

      def decrement_volume(kodi_id = 1)
        set_volume_incr_decr_vol(Types::Global::IncrementDecrement::INCREMENT, kodi_id)
      end

      def set_volume_incr_decr_vol(volume, kodi_id = 1)
        if volume.is_a?(Integer) && (volume > 100 || volume.negative?)
          throw ArgumentError.new('Volume must be between 0 and 100.')
        end
        request = KodiRequest.new(kodi_id, SET_VOLUME, { 'volume' => volume })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      private :set_volume_incr_decr_vol
    end
  end
end
