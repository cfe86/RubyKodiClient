require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Modules
    class KodiGUITests < Minitest::Test
      include Types::GUI
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.ActivateWindow", "params": {"window":"home",'\
               '"parameters":["home"]}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test(GUI, post, response, ->(mod) { mod.activate_window('home', ['home']) })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_activate_window
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.ActivateWindow", "params": {"window":"home",'\
               '"parameters":["home"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test(GUI, post, response, ->(mod) { mod.activate_window('home', ['home']) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_get_properties
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.GetProperties", "params": {"properties":["currentcontrol",'\
               '"currentwindow","fullscreen","skin","stereoscopicmode"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"currentcontrol":{"label":"Movies"},"currentwindow":{"id":10000,'\
                   '"label":"Home"},"fullscreen":false,"skin":{"id":"skin.estuary","name":"Estuary"},'\
                   '"stereoscopicmode":{"label":"Disabled","mode":"off"}}}'
        actual = run_test(GUI, post, response, ->(mod) { mod.get_properties })
        expected_value = PropertyValue.new(Types::Global::IdLabel.new(nil, 'Movies'),
                                           Types::Global::IdLabel.new(10_000, 'Home'), false,
                                           Types::Global::IdName.new('skin.estuary', 'Estuary'),
                                           StereoscopyMode.new('Disabled', 'off'))
        expected = create_kodi_response(1, expected_value)
        assert_equal(expected, actual)
      end

      def test_get_stereoscopic_modes
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.GetStereoscopicModes", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"stereoscopicmodes":[{"label":"Disabled","mode":"off"},{"label":'\
                   '"Over / Under","mode":"split_horizontal"},{"label":"Side by side","mode":"split_vertical"},'\
                   '{"label":"Anaglyph red / cyan","mode":"anaglyph_cyan_red"}]}}'
        actual = run_test(GUI, post, response, ->(mod) { mod.get_stereoscopic_modes })
        expected_result = [StereoscopyMode.new('Disabled', 'off'),
                           StereoscopyMode.new('Over / Under', 'split_horizontal'),
                           StereoscopyMode.new('Side by side', 'split_vertical'),
                           StereoscopyMode.new('Anaglyph red / cyan', 'anaglyph_cyan_red')]
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_toggle_fullscreen
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.SetFullscreen", "params": {"fullscreen":"toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":false}'
        actual = run_test(GUI, post, response, ->(mod) { mod.set_fullscreen('toggle') })
        expected = create_kodi_response(1, false)
        assert_equal(expected, actual)
      end

      def test_set_fullscreen
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.SetFullscreen", "params": {"fullscreen":false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":false}'
        actual = run_test(GUI, post, response, ->(mod) { mod.set_fullscreen(false) })
        expected = create_kodi_response(1, false)
        assert_equal(expected, actual)
      end

      def test_set_stereoscopic_mode
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.SetStereoscopicMode", "params": {"mode":"off"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test(GUI, post, response, ->(mod) { mod.set_stereoscopic_mode('off') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_show_notification
        post = '{"jsonrpc":"2.0","id":1,"method":"GUI.ShowNotification", "params": {"title":"title",'\
               '"message":"message","image":"image","displaytime":5000}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test(GUI, post, response, ->(mod) { mod.show_notification('title', 'message', 'image') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end

