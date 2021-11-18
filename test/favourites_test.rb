# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class FavouritesTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Favourites.AddFavourite", "params": {"title":"a title",'\
               '"type": "unknown"}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test('favourites', post, response, ->(mod) { mod.add_favourite('a title') })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_add_favourite
        post = '{"jsonrpc":"2.0","id":1,"method":"Favourites.AddFavourite", "params": {"title":"a title",'\
               '"type": "unknown"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('favourites', post, response, ->(mod) { mod.add_favourite('a title') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_get_favourites
        post = '{"id":1,"jsonrpc":"2.0","method":"Favourites.GetFavourites",'\
               '"params":{"properties":["path","thumbnail","window","windowparameter"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"favourites":[{"path": "the path","title":"test.mkv",'\
                   '"type":"media", "thumbnail": "the thumb"}],'\
                   '"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_favorites = [Types::Favourites::DetailsFavourite.new('the path', 'the thumb', 'test.mkv', 'media',
                                                                      nil, nil)]
        actual = run_test('favourites', post, response, ->(mod) { mod.get_favourites })
        expected = create_kodi_response(1, Types::Favourites::GetFavouriteReturned.new(expected_favorites,
                                                                                       expected_limits))
        assert_equal(expected, actual)
      end
    end
  end
end
