# frozen_string_literal: true

module KodiClient

  # the client that stores
  class KodiMethod

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
end
