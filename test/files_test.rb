# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Method
    class KodiFilesTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.GetDirectory","params":{"directory":"/path/to/file",'\
               '"media":"files","properties":["album","albumartist","albumartistid","albumid","albumlabel","art",'\
               '"artist","artistid","cast","comment","country","dateadded","description","director","disc",'\
               '"displayartist","duration","episode","episodeguide","fanart","file","firstaired","genre","genreid",'\
               '"imdbnumber","lastmodified","lastplayed","lyrics","mimetype","mood","mpaa","musicbrainzalbumartistid",'\
               '"musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid","originaltitle","playcount","plot",'\
               '"plotoutline","premiered","productioncode","rating","resume","runtime","season","set","setid",'\
               '"showlink","showtitle","size","sorttitle","specialsortepisode","specialsortseason","streamdetails",'\
               '"studio","style","tag","tagline","theme","thumbnail","title","top250","track","trailer","tvshowid",'\
               '"uniqueid","votes","watchedepisodes","writer","year"],"sort":{"ignorearticle":false,"method":"none",'\
               '"order":"ascending","useartistsortname":false},"limits":{"start":0,"end":50}}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test('files', post, response, ->(mod) { mod.get_directory('/path/to/file') })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_get_directory
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.GetDirectory","params":{"directory":"/path/to/file",'\
               '"media":"files","properties":["album","albumartist","albumartistid","albumid","albumlabel","art",'\
               '"artist","artistid","cast","comment","country","dateadded","description","director","disc",'\
               '"displayartist","duration","episode","episodeguide","fanart","file","firstaired","genre","genreid",'\
               '"imdbnumber","lastmodified","lastplayed","lyrics","mimetype","mood","mpaa","musicbrainzalbumartistid",'\
               '"musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid","originaltitle","playcount","plot",'\
               '"plotoutline","premiered","productioncode","rating","resume","runtime","season","set","setid",'\
               '"showlink","showtitle","size","sorttitle","specialsortepisode","specialsortseason","streamdetails",'\
               '"studio","style","tag","tagline","theme","thumbnail","title","top250","track","trailer","tvshowid",'\
               '"uniqueid","votes","watchedepisodes","writer","year"],"sort":{"ignorearticle":false,"method":"none",'\
               '"order":"ascending","useartistsortname":false},"limits":{"start":0,"end":50}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"files":[{"art":{},"fanart":"","file":"/path/to/file1",'\
                   '"filetype":"directory","label":"Label1","lastmodified":"2017-06-11 20:09:10",'\
                   '"mimetype":"x-directory/normal","size":0,"thumbnail":"","title":"","type":"unknown"},'\
                   '{"art":{},"fanart":"","file":"/path/to/file2","filetype":"directory","label":"Label2",'\
                   '"lastmodified":"2017-03-17 23:32:10","mimetype":"x-directory/normal","size":0,"thumbnail":"",'\
                   '"title":"","type":"unknown"}],"limits":{"end":2,"start":0,"total":2}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 2, 2)
        expected_files = [Types::List::ListItemFile.new('directory', '2017-06-11 20:09:10',
                                                        'x-directory/normal', 0, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, [], nil,
                                                        nil, nil, [], nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, 'unknown', nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, '/path/to/file1', nil,
                                                        nil, '', nil, nil, '', '', 'Label1',
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil),
                          Types::List::ListItemFile.new('directory', '2017-03-17 23:32:10',
                                                        'x-directory/normal', 0, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, [], nil,
                                                        nil, nil, [], nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil, 'unknown', nil, nil, nil, nil,
                                                        nil, nil, nil, nil, nil, '/path/to/file2', nil,
                                                        nil, '', nil, nil, '', '', 'Label2',
                                                        nil, nil, nil, nil, nil, nil, nil,
                                                        nil, nil)]
        actual = run_test('files', post, response, ->(mod) { mod.get_directory('/path/to/file') })
        expected = create_kodi_response(1, Types::Files::GetDirectoryReturned.new(expected_files, expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_file_details
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.GetFileDetails","params":{"file":"/path/to/file",'\
               '"media":"files","properties":["album","albumartist","albumartistid","albumid","albumlabel","art",'\
               '"artist","artistid","cast","comment","country","dateadded","description","director","disc",'\
               '"displayartist","duration","episode","episodeguide","fanart","file","firstaired","genre","genreid",'\
               '"imdbnumber","lastmodified","lastplayed","lyrics","mimetype","mood","mpaa","musicbrainzalbumartistid",'\
               '"musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid","originaltitle","playcount","plot",'\
               '"plotoutline","premiered","productioncode","rating","resume","runtime","season","set","setid",'\
               '"showlink","showtitle","size","sorttitle","specialsortepisode","specialsortseason","streamdetails",'\
               '"studio","style","tag","tagline","theme","thumbnail","title","top250","track","trailer","tvshowid",'\
               '"uniqueid","votes","watchedepisodes","writer","year"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"art":{},"fanart":"","file":"/path/to/file1",'\
                   '"filetype":"directory","label":"Label1","lastmodified":"2017-06-11 20:09:10",'\
                   '"mimetype":"x-directory/normal","size":0,"thumbnail":"","title":"","type":"unknown"}}'
        expected_file = Types::List::ListItemFile.new('directory', '2017-06-11 20:09:10',
                                                      'x-directory/normal', 0, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, [], nil,
                                                      nil, nil, [], nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil, 'unknown', nil, nil, nil, nil,
                                                      nil, nil, nil, nil, nil, '/path/to/file1', nil,
                                                      nil, '', nil, nil, '', '', 'Label1',
                                                      nil, nil, nil, nil, nil, nil, nil,
                                                      nil, nil)
        actual = run_test('files', post, response, ->(mod) { mod.get_file_details('/path/to/file') })
        expected = create_kodi_response(1, expected_file)
        assert_equal(expected, actual)
      end

      def test_get_sources
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.GetSources","params":{"media":"files",'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false},'\
               '"limits":{"start":0,"end":50}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":2,"start":0,"total":2},'\
                   '"sources":[{"file":"upnp://5b36/f137/",'\
                   '"label":"Emby123"},{"file":"/path/to/file","label":"movies"}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 2, 2)
        expected_sources = [Types::List::FileLabel.new('upnp://5b36/f137/', 'Emby123'),
                            Types::List::FileLabel.new('/path/to/file', 'movies')]
        actual = run_test('files', post, response, ->(mod) { mod.get_sources })
        expected = create_kodi_response(1, Types::Files::GetSourcesReturned.new(expected_sources, expected_limits))
        assert_equal(expected, actual)
      end

      def test_prepare_download
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.PrepareDownload","params":{"path":"/path/to/file"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"details":{"path":"vfs/random/path/to/file.mkv"},'\
                   '"mode":"redirect","protocol":"http"}}'
        expected_result = Types::Files::PrepareDownloadReturned.new({ 'path' => 'vfs/random/path/to/file.mkv' },
                                                                    'redirect', 'http')
        actual = run_test('files', post, response, ->(mod) { mod.prepare_download('/path/to/file') })
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_set_file_details
        post = '{"id":1,"jsonrpc":"2.0","method":"Files.SetFileDetails",'\
               '"params":{"file":"/path/to/file", "media": "video"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('files', post, response, ->(mod) { mod.set_file_details('/path/to/file') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
