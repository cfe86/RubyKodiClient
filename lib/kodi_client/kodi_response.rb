# frozen_string_literal: true

module KodiClient
  # represents a kodi response
  class KodiResponse
    include Extensions::Comparable

    attr_reader :id, :jsonrpc, :result, :error

    def initialize(hash)
      @id = hash['id']
      @jsonrpc = hash['jsonrpc']
      @result = hash['result']
      @error = KodiError.new(hash['error']) unless hash['error'].nil?
    end

    def error?
      !@error.nil?
    end
  end
end
