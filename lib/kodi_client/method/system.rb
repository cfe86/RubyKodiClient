# frozen_string_literal: true

module KodiClient
  module Method
    # contains all Kodi System methods
    class System < KodiModule

      EJECT_OPTICAL_DRIVE = 'System.EjectOpticalDrive'
      GET_PROPERTIES = 'System.GetProperties'
      HIBERNATE = 'System.Hibernate'
      REBOOT = 'System.Reboot'
      SHUTDOWN = 'System.Shutdown'
      SUSPEND = 'System.Suspend'

      def eject_optical_drive(kodi_id = 1)
        request = KodiRequest.new(kodi_id, EJECT_OPTICAL_DRIVE, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_properties(properties = Types::System::PropertyName.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROPERTIES, { 'properties' => properties })
        json = invoke_api(request)
        result = Types::System::PropertyValue.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def hibernate(kodi_id = 1)
        request = KodiRequest.new(kodi_id, HIBERNATE, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def reboot(kodi_id = 1)
        request = KodiRequest.new(kodi_id, REBOOT, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def shutdown(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SHUTDOWN, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def suspend(kodi_id = 1)
        request = KodiRequest.new(kodi_id, SUSPEND, {})
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
