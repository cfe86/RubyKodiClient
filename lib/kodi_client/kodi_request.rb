# frozen_string_literal: true

module KodiClient
  # represents a kodi requests
  class KodiRequest

    attr_accessor :id, :jsonrpc, :method, :params

    def initialize(kodi_id, method, params = {}, jsonrpc = '2.0')
      @id = kodi_id
      @jsonrpc = jsonrpc
      @method = method
      @params = params
    end
  end
end
