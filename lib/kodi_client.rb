# frozen_string_literal: true

require 'http'
require 'json'

require 'kodi_client/Chainable'
require 'kodi_client/method/addons'
require 'kodi_client/method/application'
require 'kodi_client/method/favourites'
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

    attr_reader :addons, :application, :gui, :player, :input, :favourites, :system, :profiles

    def initialize
      @addons = KodiClient::Modules::Addons.new
      @application = KodiClient::Modules::Application.new
      @favourites = KodiClient::Modules::Favourites.new
      @gui = KodiClient::Modules::GUI.new
      @input = KodiClient::Modules::Input.new
      @player = KodiClient::Modules::Player.new
      @profiles = KodiClient::Modules::Profiles.new
      @system = KodiClient::Modules::System.new
    end

    def apply_options(options)
      @addons.apply_options(options)
      @application.apply_options(options)
      @gui.apply_options(options)
      @input.apply_options(options)
      @player.apply_options(options)
      @favourites.apply_options(options)
      @profiles.apply_options(options)
      @system.apply_options(options)
    end
  end
end
