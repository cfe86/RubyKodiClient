# frozen_string_literal: true

module KodiClient

  # the client that stores
  class KodiModule

    def apply_options(options)
      @endpoint_url = "#{options.tls ? 'https://' : 'http://'}#{options.ip}:#{options.port}/jsonrpc"
      @options = options
    end

    def invoke_api(request)
      h = request.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@')] = request.instance_variable_get(var)
      end

      @http_client ||= build_client
      response = @http_client.post(@endpoint_url, json: h).to_s
      JSON.parse(response)
    end

    def build_client
      client = HTTP.headers(Content_Type: 'application/json')
      if !@options.username.nil? && !@options.password.nil?
        client = client.basic_auth({ user: @options.username, pass: @options.password })
      end

      client
    end

    private :build_client
  end

  # represents an error response
  class KodiError

    attr_reader :code, :message

    def initialize(hash)
      @code = hash['code']
      @message = hash['message']
    end

    def ==(other)
      @code == other.code && @message == other.message
    end
  end

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

  # represents a kodi response
  class KodiResponse
    include Comparable

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
