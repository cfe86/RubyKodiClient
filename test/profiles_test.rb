# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Modules
    class KodiProfilesTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Profiles.GetCurrentProfile",'\
               '"params": {"properties":["lockmode", "thumbnail"]}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test(Profiles, post, response, ->(mod) { mod.get_current_profile })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_get_current_profile
        post = '{"jsonrpc":"2.0","id":1,"method":"Profiles.GetCurrentProfile", '\
               '"params": {"properties":["lockmode", "thumbnail"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"label":"Master user","lockmode":0,"thumbnail":"a thumbnail"}}'
        actual = run_test(Profiles, post, response, ->(mod) { mod.get_current_profile })
        expected_result = Types::Profiles::DetailsProfile.new(0, 'a thumbnail', 'Master user')
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_get_profiles
        post = '{"id":1,"jsonrpc":"2.0","method":"Profiles.GetProfiles",'\
               '"params":{"properties":["lockmode","thumbnail"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":2,"start":0,"total":2},'\
                   '"profiles":[{"label":"Master user","lockmode":0,"thumbnail":"a thumbnail"},'\
                   '{"label":"Test","lockmode":0,"thumbnail":"image://path/to/thumb.jpg"}]}}'
        actual = run_test(Profiles, post, response, ->(mod) { mod.get_profiles })
        expected_limits = Types::List::ListLimitsReturned.new(0, 2, 2)
        expected_profiles = [Types::Profiles::DetailsProfile.new(0, 'a thumbnail', 'Master user'),
                             Types::Profiles::DetailsProfile.new(0, 'image://path/to/thumb.jpg', 'Test')]
        expected = create_kodi_response(1, Types::Profiles::GetProfilesReturned.new(expected_limits, expected_profiles))
        assert_equal(expected, actual)
      end

      def test_load_profile
        post = '{"jsonrpc":"2.0","id":1,"method":"Profiles.LoadProfile",'\
               '"params": {"profile": "my profile",'\
               '"password": {"value":"pw_val", "encryption":"md5"}, "prompt": false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        pw = Types::Profiles::ProfilePassword.new('pw_val')
        actual = run_test(Profiles, post, response, ->(mod) { mod.load_profile('my profile', pw) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
