# frozen_string_literal: true

require_relative 'options'

module KodiClient
  # Offers methods like connect, auth and tls to be chained together
  module Chainable

    attr_accessor :options, :client

    def connect(ip, port)
      merge_options(->(options) { options.with_connection(ip, port) })
    end

    def auth(username, password)
      merge_options(->(options) { options.with_auth(username, password) })
    end

    def use_tls(enabled: true)
      merge_options(->(options) { options.with_tls(enabled) })
    end

    def merge_options(set_command)
      client = def_client
      options = def_options
      set_command.call(options)
      client.apply_options(options)
      client
    end

    def def_client
      if @client.nil?
        @client = KodiClient::Client.new
        @client.client = @client
      end
      @client
    end

    def def_options
      if @options.nil?
        @options ||= KodiClient::Options.new
        @client.options = @options
      end
      @options
    end
  end
end
