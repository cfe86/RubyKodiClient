# frozen_string_literal: true

require 'kodi_client/kodi_module'
require 'kodi_client/global_types/profiles_types'

module KodiClient
  module Modules
    # contains all Kodi Application methods
    class Profiles < KodiModule

      GET_CURRENT_PROFILE = 'Profiles.GetCurrentProfile'
      GET_PROFILES = 'Profiles.GetProfiles'
      LOAD_PROFILE = 'Profiles.LoadProfile'

      def get_current_profile(properties = Types::Profiles::FieldsProfile.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_CURRENT_PROFILE, { 'properties' => properties })
        json = invoke_api(request)
        result = json['result'].nil? ? nil : Types::Profiles::DetailsProfile.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def get_profiles(properties = Types::Profiles::FieldsProfile.all_properties,
                       limit = Types::List::ListLimits.new(0, 50),
                       sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROFILES,
                                  { 'properties' => properties,
                                    'limits' => { 'start' => limit.list_start, 'end' => limit.list_end },
                                    'sort' => { 'ignorearticle' => sort.ignore_article, 'method' => sort.method,
                                                'order' => sort.order,
                                                'useartistsortname' => sort.use_artist_sort_name } })
        json = invoke_api(request)
        result = json['result'].nil? ? nil : Types::Profiles::GetProfilesReturned.new(json['result'])
        json['result'] = result
        KodiResponse.new(json)
      end

      def load_profile(profile_name, password, prompt = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, LOAD_PROFILE,
                                  { 'profile' => profile_name,
                                    'password' => { 'value' => password.value, 'encryption' => password.encryption },
                                    'prompt' => prompt })
        json = invoke_api(request)
        KodiResponse.new(json)
      end
    end
  end
end
