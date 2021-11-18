# frozen_string_literal: true

require 'http'
require 'json'

require 'kodi_client/Chainable'

require 'kodi_client/util/comparable'
require 'kodi_client/util/creatable'
require 'kodi_client/util/iterable'

require 'kodi_client/method/addons'
require 'kodi_client/method/audio_library'
require 'kodi_client/method/application'
require 'kodi_client/method/favourites'
require 'kodi_client/method/files'
require 'kodi_client/method/gui'
require 'kodi_client/method/input'
require 'kodi_client/method/player'
require 'kodi_client/method/profiles'
require 'kodi_client/method/system'


# client for Kodi rest api https://kodi.wiki/view/JSON-RPC_API/v12
module KodiClient
  extend Chainable

  # client that holds all methods such as application, gui etc.
  class Client
    include Chainable

    attr_reader :audio_library, :addons, :application, :favourites, :files, :gui, :input, :player, :profiles, :system

    def initialize
      @addons = KodiClient::Method::Addons.new
      @audio_library = KodiClient::Method::AudioLibrary.new
      @application = KodiClient::Method::Application.new
      @favourites = KodiClient::Method::Favourites.new
      @files = KodiClient::Method::Files.new
      @gui = KodiClient::Method::GUI.new
      @input = KodiClient::Method::Input.new
      @player = KodiClient::Method::Player.new
      @profiles = KodiClient::Method::Profiles.new
      @system = KodiClient::Method::System.new
    end

    def apply_options_to_methods(options)
      instance_variables.each do |it|
        mod = instance_variable_get(it)
        mod.apply_options(options) if mod.is_a?(KodiClient::KodiModule)
      end
    end
  end
end
