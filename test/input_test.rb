# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class InputTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Back", "params": {}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test('input', post, response, ->(mod) { mod.back })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_input
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Back", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.back })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_context_menu
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.ContextMenu", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.context_menu })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_down
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Down", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.down })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_execute_action
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.ExecuteAction", "params": { "action": "stop"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.execute_action(Types::Input::InputAction::STOP) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_home
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Home", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.home })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_info
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Info", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.info })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_left
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Left", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.left })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_right
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Right", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.right })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_select
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Select", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.select })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_send_text
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.SendText", "params": { "text": "my text", "done": false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.send_text('my text', false) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_show_codec
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.ShowCodec", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.show_codec })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_show_osd
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.ShowOSD", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.show_osd })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_show_player_process_info
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.ShowPlayerProcessInfo", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.show_player_process_info })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_up
        post = '{"jsonrpc":"2.0","id":1,"method":"Input.Up", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('input', post, response, ->(mod) { mod.up })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
