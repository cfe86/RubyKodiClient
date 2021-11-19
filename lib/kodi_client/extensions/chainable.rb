# frozen_string_literal: true

module KodiClient
  module Extensions
    # Offers methods like connect, auth and tls to be chained together
    module Chainable

      attr_accessor :options, :client

      # Creates a new Client instance and sets the given ip and port to connect to it
      # @param ip [String] the ip to use
      # @param port [Integer] the port to connect to
      # @raise [ArgumentError] thrown if ip or port is nil
      # @return [Client] the created client
      def connect(ip, port)
        throw ArgumentError('ip or port can\'t be nil.') if ip.nil? || port.nil?
        @client = KodiClient::Client.new
        merge_options(->(options) { options.with_connection(ip, port) })
      end

      # sets username and password if required
      # @param username [String] the username
      # @param password [String] the password
      # @return [Client] the existing, or if not existed, a new created client
      def auth(username, password)
        throw ArgumentError('username or password can\'t be nil.') if username.nil? || password.nil?
        merge_options(->(options) { options.with_auth(username, password) })
      end

      # enables/disables the use of TLS
      # @param enabled [Boolean] true to enable it, false to disable
      # @return [Client] the existing, or if not existed, a new created client
      def use_tls(enabled: true)
        merge_options(->(options) { options.with_tls(enabled) })
      end

      # merges the existing options with the new options
      # @param [Proc] set_command so command to execute on the existing options to merge them
      # @return [Client] the existing, or if not existed, a new created client
      def merge_options(set_command)
        client = def_client
        options = def_options
        set_command.call(options)
        client.apply_options_to_methods(options)
        client
      end

      # Creates a new, or if one already exists, returns the existing client
      # @return [Client] the new or existing client
      def def_client
        if @client.nil?
          @client = KodiClient::Client.new
          @client.client = @client
        end
        @client
      end

      # Creates a new, or if one already exists, returns the existing Options
      # @return [KodiOptions] the new or existing Options
      def def_options
        if @options.nil?
          @options ||= KodiClient::KodiOptions.new
          @client.options = @options
        end
        @options
      end

      private :def_client, :def_options, :merge_options
    end
  end
end
