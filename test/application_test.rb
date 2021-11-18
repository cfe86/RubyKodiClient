# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Modules
    class KodiApplicationTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetMute", "params": {"mute":"toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","error":{"code":-32601,"message":"Method not found."}}'
        actual = run_test(Application, post, response, ->(mod) { mod.mute })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_quit
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.Quit", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":true}'
        actual = run_test(Application, post, response, ->(mod) { mod.quit })
        expected = create_kodi_response(1, true)
        assert_equal(expected, actual)
      end

      def test_toggle_mute
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetMute", "params": {"mute":"toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":true}'
        actual = run_test(Application, post, response, ->(mod) { mod.mute })
        expected = create_kodi_response(1, true)
        assert_equal(expected, actual)
      end

      def test_set_mute
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetMute", "params": {"mute":true}}'
        response = '{"id":1,"jsonrpc":"2.0","result":true}'
        actual = run_test(Application, post, response, ->(mod) { mod.mute(mute_state: true) })
        expected = create_kodi_response(1, true)
        assert_equal(expected, actual)
      end

      def test_get_properties
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.GetProperties", "params": {"properties":["language",'\
               '"muted","name","sorttokens","version","volume"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"muted":false,"name":"Kodi","version":{"major":17,"minor":6,'\
                   '"revision":"20171114-a9a7a20","tag":"stable"},"volume":100}}'
        actual = run_test(Application, post, response, ->(mod) { mod.get_properties })
        version = Types::Application::Version.new(17, 6, '20171114-a9a7a20', 'stable')
        result = Types::Application::PropertyValue.new('Kodi', version, false, 100)
        expected = create_kodi_response(1, result)
        assert_equal(expected, actual)
      end

      def test_set_volume
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetVolume", "params": {"volume":20}}'
        response = '{"id":1,"jsonrpc":"2.0","result":20}'
        actual = run_test(Application, post, response, ->(mod) { mod.set_volume(20) })
        expected = create_kodi_response(1, 20)
        assert_equal(expected, actual)
      end

      def test_increment_volume
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetVolume", "params": {"volume": "increment"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": 20}'
        actual = run_test(Application, post, response,
                          ->(mod) { mod.set_volume(KodiClient::Types::Global::IncrementDecrement::INCREMENT) })
        expected = create_kodi_response(1, 20)
        assert_equal(expected, actual)
      end

      def test_decrement_volume
        post = '{"jsonrpc":"2.0","id":1,"method":"Application.SetVolume", "params": {"volume": "decrement"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": 20}'
        actual = run_test(Application, post, response,
                          ->(mod) { mod.set_volume(KodiClient::Types::Global::IncrementDecrement::DECREMENT) })
        expected = create_kodi_response(1, 20)
        assert_equal(expected, actual)
      end
    end
  end
end
