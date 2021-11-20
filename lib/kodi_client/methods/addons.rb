# frozen_string_literal: true

module KodiClient
  module Methods
    # contains all Kodi Application methods
    class Addons < KodiMethod

      EXECUTE_ADDON = 'Addons.ExecuteAddon'
      GET_ADDON_DETAILS = 'Addons.GetAddonDetails'
      GET_ADDONS = 'Addons.GetAddons'
      SET_ADDON_ENABLED = 'Addons.SetAddonEnabled'

      def get_addons(type = Types::Addons::AddonTypes::UNKNOWN,
                     content = Types::Addons::AddonContent::UNKNOWN,
                     enabled = nil, properties = [],
                     limits = Types::List::ListLimits.new(0, 50), installed = nil, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ADDONS,
                                  {
                                    'type' => type,
                                    'content' => content,
                                    'enabled' => enabled.nil? || !enabled ? 'all' : 'enabled',
                                    'properties' => properties,
                                    'limits' => limits.to_h,
                                    'installed' => installed.nil? || !installed ? 'all' : 'installed'
                                  })
        json = invoke_api(request)
        result = Types::Addons::GetAddonsReturned.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_addon_details(addon_id = nil, properties = [], kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ADDON_DETAILS, { 'addonid' => addon_id,
                                                                'properties' => properties })
        json = invoke_api(request)

        result = Types::Addons::GetAddonReturned.create(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def execute_addon(addon_id = nil, params = '', wait = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, EXECUTE_ADDON, { 'addonid' => addon_id, 'params' => params,
                                                            'wait' => wait })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_addon_enabled(addon_id = nil, enabled = Types::Global::Toggle::TOGGLE, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SET_ADDON_ENABLED, { 'addonid' => addon_id, 'enabled' => enabled })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
