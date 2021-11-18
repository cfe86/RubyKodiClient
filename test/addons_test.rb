# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class AddonsTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Addons.GetAddons", "params": {"type":"unknown","content":"unknown",'\
               '"enabled":"all","properties":[],"limits":{"start":0,"end":50},"installed":"all"}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test('addons', post, response, ->(mod) { mod.get_addons })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_get_addons
        post = '{"jsonrpc":"2.0","id":1,"method":"Addons.GetAddons", "params": {"type":"unknown","content":"unknown",'\
               '"enabled":"all","properties":[],"limits":{"start":0,"end":50},"installed":"all"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"addons":[{"addonid":"audiodecoder.modplug","author":"spiff",'\
                   '"broken":false,"dependencies":[{"addonid":"kodi.audiodecoder","optional":false,'\
                   '"version":"1.0.0"}],"description":"Modplug Audio Decoder","disclaimer":"","enabled":false,'\
                   '"extrainfo":[],"fanart":"","installed":true,"name":"Modplug Audio Decoder",'\
                   '"path":"/path/to/audiodecoder.modplug","rating":-1,"summary":"Modplug Audio Decoder",'\
                   '"thumbnail":"","type":"kodi.audiodecoder","version":"1.1.0"}],'\
                   '"limits":{"end":2,"start":0,"total":2}}}'
        actual = run_test('addons', post, response, ->(mod) { mod.get_addons })
        expected_limits = Types::List::ListLimitsReturned.new(0, 2, 2)
        expected_dependencies = [Types::Addons::AddonDependency.new('kodi.audiodecoder', false, '1.0.0')]
        expected_addons = [Types::Addons::AddonDetails.new(
          'audiodecoder.modplug', 'spiff', false, expected_dependencies, 'Modplug Audio Decoder', '',
          false, [], '', true, 'Modplug Audio Decoder', '/path/to/audiodecoder.modplug',
          -1, 'Modplug Audio Decoder', '', 'kodi.audiodecoder', '1.1.0', nil
        )]
        expected = create_kodi_response(1, Types::Addons::Addons.new(expected_addons, expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_addon_details
        post = '{"jsonrpc":"2.0","id":1,"method":"Addons.GetAddonDetails", "params":'\
               '{"addonid":"audiodecoder.modplug","properties":[]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"addon":{"addonid":"audiodecoder.modplug","author":"spiff",'\
                   '"broken":false,"dependencies":[{"addonid":"kodi.audiodecoder","optional":false,'\
                   '"version":"1.0.0"}],"description":"Modplug Audio Decoder","disclaimer":"","enabled":false,'\
                   '"extrainfo":[],"fanart":"","installed":true,"name":"Modplug Audio Decoder",'\
                   '"path":"/path/to/audiodecoder.modplug","rating":-1,"summary":"Modplug Audio Decoder",'\
                   '"thumbnail":"","type":"kodi.audiodecoder","version":"1.1.0"}}}'
        actual = run_test('addons', post, response, ->(mod) { mod.get_addon_details('audiodecoder.modplug') })
        expected_dependencies = [Types::Addons::AddonDependency.new('kodi.audiodecoder', false, '1.0.0')]
        expected_addon = Types::Addons::AddonDetails.new(
          'audiodecoder.modplug', 'spiff', false, expected_dependencies, 'Modplug Audio Decoder', '',
          false, [], '', true, 'Modplug Audio Decoder', '/path/to/audiodecoder.modplug',
          -1, 'Modplug Audio Decoder', '', 'kodi.audiodecoder', '1.1.0', nil
        )
        expected = create_kodi_response(1, Types::Addons::Addon.new(expected_addon), nil, nil)
        assert_equal(expected, actual)
      end

      def test_execute_addon_url
        post = '{"jsonrpc":"2.0","id":1,"method":"Addons.ExecuteAddon", "params": {"addonid":"audiodecoder.modplug",'\
               '"wait":false,"params":"?a_url"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('addons', post, response, ->(mod) { mod.execute_addon('audiodecoder.modplug', '?a_url') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_addon_enabled
        post = '{"jsonrpc":"2.0","id":1,"method":"Addons.SetAddonEnabled",'\
               '"params": {"addonid":"modplug","enabled":"toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('addons', post, response, ->(mod) { mod.set_addon_enabled('modplug', 'toggle') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
