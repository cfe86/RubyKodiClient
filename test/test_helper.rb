# frozen_string_literal: true

require 'kodi_client'

module KodiClient
  module Test

    class MockHttpClient < Minitest::Test

      def initialize(post, response)
        super('MockHttpClient')
        @response = response
        @post = post
      end

      def post(_, arg2)
        actual_json = arg2[:json]
        expected_json = JSON.parse(@post)

        assert_equal(actual_json, expected_json)

        @response
      end
    end

    def create_kodi_response(id, result, error_code = nil, error_message = nil)
      error = error_code.nil? ? nil : { 'code' => error_code, 'message' => error_message }
      KodiClient::KodiResponse.new({ 'id' => id, 'jsonrpc' => '2.0', 'result' => result, 'error' => error })
    end

    def run_test(kodi_method, post, response, method)
      HTTP::Client.stub :new, MockHttpClient.new(post, response) do
        client = KodiClient.connect('127.0.0.1', 8080)
        client.apply_options_to_methods(KodiClient::KodiOptions.new)
        mod = client.instance_variable_get("@#{kodi_method}")
        method.call(mod)
      end
    end
  end
end
