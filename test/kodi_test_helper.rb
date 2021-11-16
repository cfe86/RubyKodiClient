# frozen_string_literal: true

require 'kodi_client/method/application'
require 'kodi_client/method/addons'
require 'kodi_client/method/gui'
require 'kodi_client/method/player'
require 'kodi_client/method/input'

require 'kodi_client/global_types/global_types'
require 'kodi_client/global_types/application_types'
require 'kodi_client/global_types/addon_types'
require 'kodi_client/global_types/gui_types'
require 'kodi_client/global_types/item_types'
require 'kodi_client/global_types/list_types'
require 'kodi_client/options'

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

    def run_test(kodi_module, post, response, method)
      HTTP::Client.stub :new, MockHttpClient.new(post, response) do
        client = kodi_module.new
        client.apply_options(KodiClient::Options.new)
        method.call(client)
      end
    end
  end
end
