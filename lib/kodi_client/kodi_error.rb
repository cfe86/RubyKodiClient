# frozen_string_literal: true

module KodiClient
  # represents an error response
  class KodiError
    include Comparable
    attr_reader :code, :message

    def initialize(hash)
      @code = hash['code']
      @message = hash['message']
    end
  end
end
