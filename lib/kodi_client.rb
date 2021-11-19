# frozen_string_literal: true

require 'http'
require 'json'

require 'kodi_client/extensions/chainable'
require 'kodi_client/extensions/comparable'
require 'kodi_client/extensions/creatable'
require 'kodi_client/extensions/iterable'

require 'kodi_client/kodi_error'
require 'kodi_client/kodi_request'
require 'kodi_client/kodi_response'
require 'kodi_client/kodi_method'
require 'kodi_client/kodi_options'

require 'kodi_client/types/items/item_details_base_type'

require 'kodi_client/types/global/toggle_type'
require 'kodi_client/types/global/rotate_type'
require 'kodi_client/types/global/direction_type'
require 'kodi_client/types/global/next_prev_type'
require 'kodi_client/types/global/increment_decrement_type'
require 'kodi_client/types/global/id_label_type'
require 'kodi_client/types/global/id_name_type'
require 'kodi_client/types/global/global_time_type'
require 'kodi_client/types/global/password_encryption_type'

require 'kodi_client/types/application/property_name_type'
require 'kodi_client/types/application/version_type'
require 'kodi_client/types/application/property_value_type'

require 'kodi_client/types/pvr/channel_type_type'

require 'kodi_client/types/input/input_action_type'

require 'kodi_client/types/system/property_name_type'
require 'kodi_client/types/system/property_value_type'

require 'kodi_client/types/media/media_type_type'
require 'kodi_client/types/media/media_details_base_type'
require 'kodi_client/types/media/media_artwork_type'

require 'kodi_client/types/list/list_limits_type'
require 'kodi_client/types/list/list_limits_returned_type'
require 'kodi_client/types/list/sort_order_type'
require 'kodi_client/types/list/list_sort_type'
require 'kodi_client/types/list/list_fields_all_type'
require 'kodi_client/types/list/list_field_files_type'

require 'kodi_client/types/favourites/type_type'
require 'kodi_client/types/favourites/fields_favourite_type'
require 'kodi_client/types/favourites/details_favourite_type'
require 'kodi_client/types/favourites/get_favourite_returned_type'

require 'kodi_client/types/player/zoom_type'
require 'kodi_client/types/player/view_mode_type'
require 'kodi_client/types/player/player_visibility_type'
require 'kodi_client/types/player/player_type_type'
require 'kodi_client/types/player/player_repeat_type'
require 'kodi_client/types/player/player_speed_type'
require 'kodi_client/types/player/player_type'
require 'kodi_client/types/player/subtitle_type'
require 'kodi_client/types/player/audio_stream_type'
require 'kodi_client/types/player/video_stream_type'
require 'kodi_client/types/player/property_name_type'
require 'kodi_client/types/player/property_value_type'
require 'kodi_client/types/player/player_view_mode_type'
require 'kodi_client/types/player/player_position_time_type'
require 'kodi_client/types/player/seek_jump_type'
require 'kodi_client/types/player/seek_returned_type'

require 'kodi_client/types/audio/audio_contributor_type'
require 'kodi_client/types/audio/audio_album_release_type_type'
require 'kodi_client/types/audio/audio_details_base_type'
require 'kodi_client/types/audio/audio_details_media_type'
require 'kodi_client/types/audio/audio_fields_album_type'
require 'kodi_client/types/audio/genre_type'
require 'kodi_client/types/audio/details_album_type'
require 'kodi_client/types/audio/get_albums_returned_type'

require 'kodi_client/types/video/video_details_base_type'
require 'kodi_client/types/video/video_cast_type'
require 'kodi_client/types/video/video_details_media_type'
require 'kodi_client/types/video/video_details_item_type'
require 'kodi_client/types/video/video_details_file_type'
require 'kodi_client/types/video/video_resume_type'
require 'kodi_client/types/video/stream_details_type'

require 'kodi_client/types/list/list_item_base_type'
require 'kodi_client/types/list/list_item_all_type'
require 'kodi_client/types/list/list_item_file_type'
require 'kodi_client/types/list/list_sort_method_type'

require 'kodi_client/types/files/file_label_type'
require 'kodi_client/types/files/media_type'
require 'kodi_client/types/files/get_directory_returned_type'
require 'kodi_client/types/files/get_sources_returned_type'
require 'kodi_client/types/files/prepare_download_returned_type'

require 'kodi_client/types/profiles/fields_profile_type'
require 'kodi_client/types/profiles/details_profile_type'
require 'kodi_client/types/profiles/get_profiles_returned_type'
require 'kodi_client/types/profiles/profile_password_type'

require 'kodi_client/types/gui/gui_window_type'
require 'kodi_client/types/gui/property_name_type'
require 'kodi_client/types/gui/stereoscopy_mode_type'
require 'kodi_client/types/gui/property_value_type'

require 'kodi_client/types/addons/addon_dependency_type'
require 'kodi_client/types/addons/addon_fields_type'
require 'kodi_client/types/addons/addon_extra_info_type'
require 'kodi_client/types/addons/addon_content_type'
require 'kodi_client/types/addons/addon_types_type'
require 'kodi_client/types/addons/addon_details_type'
require 'kodi_client/types/addons/get_addon_returned_type'
require 'kodi_client/types/addons/get_addons_returned_type'

require 'kodi_client/methods/addons'
require 'kodi_client/methods/audio_library'
require 'kodi_client/methods/application'
require 'kodi_client/methods/favourites'
require 'kodi_client/methods/files'
require 'kodi_client/methods/gui'
require 'kodi_client/methods/input'
require 'kodi_client/methods/player'
require 'kodi_client/methods/profiles'
require 'kodi_client/methods/system'

# client for Kodi rest api https://kodi.wiki/view/JSON-RPC_API/v12
module KodiClient
  extend Extensions::Chainable

  # client that holds all methods such as application, gui etc.
  class Client
    include Extensions::Chainable

    attr_reader :audio_library, :addons, :application, :favourites, :files, :gui, :input, :player, :profiles, :system

    def initialize
      @addons = Methods::Addons.new
      @audio_library = Methods::AudioLibrary.new
      @application = Methods::Application.new
      @favourites = Methods::Favourites.new
      @files = Methods::Files.new
      @gui = Methods::GUI.new
      @input = Methods::Input.new
      @player = Methods::Player.new
      @profiles = Methods::Profiles.new
      @system = Methods::System.new
    end

    def apply_options_to_methods(options)
      instance_variables.each do |it|
        mod = instance_variable_get(it)
        mod.apply_options(options) if mod.is_a?(KodiMethod)
      end
    end
  end
end
