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

require 'kodi_client/types/global_types'
require 'kodi_client/types/item_types'
require 'kodi_client/types/media_types'
require 'kodi_client/types/player_type'
require 'kodi_client/types/pvr_type'
require 'kodi_client/types/audio_types'
require 'kodi_client/types/video_types'
require 'kodi_client/types/system_types'
require 'kodi_client/types/list_types'
require 'kodi_client/types/application_types'
require 'kodi_client/types/addon_types'
require 'kodi_client/types/gui_types'
require 'kodi_client/types/favourites_types'
require 'kodi_client/types/profiles_types'
require 'kodi_client/types/input_types'
require 'kodi_client/types/files_types'

# client for Kodi rest api https://kodi.wiki/view/JSON-RPC_API/v12
module KodiClient
  extend Chainable

  # client that holds all methods such as application, gui etc.
  class Client
    include Chainable

    attr_reader :audio_library, :addons, :application, :favourites, :files, :gui, :input, :player, :profiles, :system

    def initialize
      @addons = KodiClient::Methods::Addons.new
      @audio_library = KodiClient::Methods::AudioLibrary.new
      @application = KodiClient::Methods::Application.new
      @favourites = KodiClient::Methods::Favourites.new
      @files = KodiClient::Methods::Files.new
      @gui = KodiClient::Methods::GUI.new
      @input = KodiClient::Methods::Input.new
      @player = KodiClient::Methods::Player.new
      @profiles = KodiClient::Methods::Profiles.new
      @system = KodiClient::Methods::System.new
    end

    def apply_options_to_methods(options)
      instance_variables.each do |it|
        mod = instance_variable_get(it)
        mod.apply_options(options) if mod.is_a?(KodiClient::KodiMethod)
      end
    end
  end
end
