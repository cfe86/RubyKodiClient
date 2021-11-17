# frozen_string_literal: true

require 'minitest/autorun'
require 'kodi_test_helper'

module KodiClient
  module Modules
    class KodiSystemTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"System.EjectOpticalDrive", "params": {}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test(System, post, response, ->(mod) { mod.eject_optical_drive })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_eject_optical_drive
        post = '{"jsonrpc":"2.0","id":1,"method":"System.EjectOpticalDrive", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(System, post, response, ->(mod) { mod.eject_optical_drive })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_get_properties
        post = '{"jsonrpc":"2.0","id":1,"method":"System.GetProperties", '\
               '"params": {"properties":["canhibernate","canreboot","canshutdown","cansuspend"]}}'
        response = '{"id":1,"jsonrpc":"2.0",'\
                   '"result":{"canhibernate":true,"canreboot":true,"canshutdown":true,"cansuspend":true}}'
        actual = run_test(System, post, response, ->(mod) { mod.get_properties })
        expected_result = Types::System::PropertyValue.new(true, true, true, true)
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_hibernate
        post = '{"jsonrpc":"2.0","id":1,"method":"System.Hibernate", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(System, post, response, ->(mod) { mod.hibernate })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_reboot
        post = '{"jsonrpc":"2.0","id":1,"method":"System.Reboot", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(System, post, response, ->(mod) { mod.reboot })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_shutdown
        post = '{"jsonrpc":"2.0","id":1,"method":"System.Shutdown", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(System, post, response, ->(mod) { mod.shutdown })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_suspend
        post = '{"jsonrpc":"2.0","id":1,"method":"System.Suspend", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(System, post, response, ->(mod) { mod.suspend })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end

