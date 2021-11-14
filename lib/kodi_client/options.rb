# frozen_string_literal: true

module KodiClient
  # holds all options like ip, port, credentials
  class Options

    attr_accessor :ip, :port, :username, :password, :tls

    def initialize
      @tls = false
    end

    def with_connection(ip, port)
      @ip = ip
      @port = port
    end

    def with_auth(username, password)
      @username = username
      @password = password
    end

    def with_tls(enabled: true)
      @tls = enabled
    end
  end
end
