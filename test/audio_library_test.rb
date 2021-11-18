# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Modules
    class KodiAudioLibraryTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"AudioLibrary.Clean", "params": {"showdialogs":true}}'
        response = '{"id":1,"jsonrpc":"2.0","error":{"code":-32601,"message":"Method not found."}}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.clean })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_clean
        post = '{"jsonrpc":"2.0","id":1,"method":"AudioLibrary.Clean", "params": {"showdialogs":true}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.clean })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_export
        post = '{"jsonrpc":"2.0","id":1,"method":"AudioLibrary.Export",'\
               '"params": {"options": {"path":"/path/to/folder"}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.export('/path/to/folder') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      # def test_get_album_details
      #   post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.Export","params":{"albumid":"abc","properties":['\
      #          '"albumlabel","artist","artistid","compilation","dateadded","description","displayartist","fanart",'\
      #          '"genre","genreid","mood","musicbrainzalbumartistid","musicbrainzalbumid","playcount","rating",'\
      #          '"releasetype","style","theme","thumbnail","title","type","userrating","votes","year"]}}'
      #   response = '{"id":1,"jsonrpc":"2.0","result":{"albumdetails":{"albumid":1,"albumlabel":"","artist":["A1"],'\
      #              '"artistid":[2],"compilation":false,"dateadded":"2018-06-03 22:26:16","description":"",'\
      #              '"displayartist":"A1","fanart":"","songgenres":["Rock"],"sourceid":[1],"label":"A1","mood":[],'\
      #              '"musicbrainzalbumartistid":[""],"musicbrainzalbumid":"","playcount":0,"rating":0,'\
      #              '"releasetype":"album","style":[],"theme":[],"thumbnail":"image://music@image.mp3/","title":"A1",'\
      #              '"type":"","userrating":0,"votes":0,"year":2013}}}}'
      #   actual = run_test(AudioLibrary, post, response, ->(mod) { mod.export('/path/to/folder') })
      #   expected = create_kodi_response(1, 'OK')
      #   assert_equal(expected, actual)
      # end
    end
  end
end
