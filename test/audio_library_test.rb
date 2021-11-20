# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class AudioLibraryTests < Minitest::Test
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

      def test_scan
        post = '{"jsonrpc":"2.0","id":1,"method":"AudioLibrary.Scan", "params": {"showdialogs":true}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.scan })
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

      def test_get_albums
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetAlbums","params":{"properties":["albumduration",'\
               '"albumlabel","albumstatus","art","artist","artistid","compilation","dateadded","datemodified",'\
               '"datenew","description","displayartist","fanart","genre","isboxset","lastplayed",'\
               '"mood","musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzreleasegroupid","originaldate",'\
               '"playcount","rating","releasedate","releasetype","songgenres","sortartist","sourceid","style","theme",'\
               '"thumbnail","title","totaldiscs","type","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false},'\
               '"includesingles":false,"allroles":false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"albums":[{"albumduration":2512,"albumid":2,"albumlabel":"",'\
                   '"albumstatus":"","art":{"thumb":"image:music@path/to/mp3"},"artist":["artist1"],"artistid":[3],'\
                   '"compilation":false,"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","description":"","displayartist":"artist1","fanart":"",'\
                   '"genre":["Rock"],"isboxset":false,"label":"label1","lastplayed":"","mood":["mood"],'\
                   '"musicbrainzalbumartistid":[""],"musicbrainzalbumid":"","musicbrainzreleasegroupid":"",'\
                   '"originaldate":"2008","playcount":0,"rating":0,"releasedate":"2008","releasetype":"album",'\
                   '"songgenres":[{"genreid":1,"title":"Rock"}],"sortartist":"","sourceid":[1],"style":[],"theme":[],'\
                   '"thumbnail":"image:music@path/to/mp3","title":"title1","totaldiscs":1,"type":"","userrating":0,'\
                   '"votes":0,"year":2008}],"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:music@path/to/mp3')
        expected_song_genres = [Types::Audio::Genre.new(1, 'Rock')]
        expected_album = Types::Audio::AudioDetailsAlbum.new(2512, 2, '', '', expected_art,
                                                             ['artist1'], [3], false, '2021-11-08 21:02:32',
                                                             '2021-11-18 00:42:54', '2021-11-18 00:42:54', '', 'artist1',
                                                             '', ['Rock'], false, 'label1', '', ['mood'], [''],
                                                             '', '', '2008', 0, 0,
                                                             '2008', 'album', expected_song_genres, '', [1],
                                                             [], [], 'image:music@path/to/mp3', 'title1', 1,
                                                             '', 0, 0, 2008)
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_albums })
        expected = create_kodi_response(1, Types::Audio::GetAlbumsReturned.new([expected_album], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_album_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetAlbumDetails","params":{"albumid":2,'\
               '"properties":["albumduration","albumlabel","albumstatus","art","artist","artistid","compilation",'\
               '"dateadded","datemodified","datenew","description","displayartist","fanart","genre","isboxset",'\
               '"lastplayed","mood","musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzreleasegroupid",'\
               '"originaldate","playcount","rating","releasedate","releasetype","songgenres","sortartist","sourceid",'\
               '"style","theme","thumbnail","title","totaldiscs","type","userrating","votes","year"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"albumdetails":{"albumid":2,"albumlabel":"","albumstatus":"",'\
                   '"art":{"thumb":"image:music@path/to/mp3"},"artist":["artist1"],"artistid":[3],"compilation":false,'\
                   '"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","description":"","displayartist":"artist1","fanart":"",'\
                   '"genre":["Rock"],"isboxset":false,"label":"label1","lastplayed":"","mood":["mood"],'\
                   '"musicbrainzalbumartistid":[""],"musicbrainzalbumid":"","musicbrainzreleasegroupid":"",'\
                   '"originaldate":"2008","playcount":0,"rating":0.0,"releasedate":"2008","releasetype":"album",'\
                   '"songgenres":[{"genreid":1,"title":"Rock"}],"sortartist":"","sourceid":[1],"style":[],"theme":[],'\
                   '"thumbnail":"image:music@path/to/mp3","title":"title1","totaldiscs":1,"type":"",'\
                   '"userrating":0,"votes":0,"year":2008}}}'
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:music@path/to/mp3')
        expected_song_genres = [Types::Audio::Genre.new(1, 'Rock')]
        expected_album = Types::Audio::AudioDetailsAlbum.new(nil, 2, '', '', expected_art,
                                                             ['artist1'], [3], false, '2021-11-08 21:02:32',
                                                             '2021-11-18 00:42:54', '2021-11-18 00:42:54', '', 'artist1',
                                                             '', ['Rock'], false, 'label1', '', ['mood'], [''],
                                                             '', '', '2008', 0, 0,
                                                             '2008', 'album', expected_song_genres, '', [1],
                                                             [], [], 'image:music@path/to/mp3', 'title1', 1,
                                                             '', 0, 0, 2008)
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_album_details(2) })
        expected = create_kodi_response(1, expected_album)
        assert_equal(expected, actual)
      end

      def test_get_artist_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetArtistDetails","params":{"artistid":1,'\
               '"properties":["art","born","compilationartist","dateadded","datemodified","datenew","description",'\
               '"died","disambiguation","disbanded","fanart","formed","gender","genre","instrument","isalbumartist",'\
               '"mood","musicbrainzartistid","roles","songgenres","sortname","sourceid","style","thumbnail",'\
               '"type","yearsactive"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"artistdetails":{"art":{"icon":"image://DefaultArtist.png/"},'\
                   '"artist":"[Missing]","artistid":1,"born":"","compilationartist":false,"dateadded":"",'\
                   '"datemodified":"2021-11-10 00:16:57","datenew":"2021-11-10 00:16:57","description":"","died":"",'\
                   '"disambiguation":"","disbanded":"","fanart":"","formed":"","gender":"","genre":[],"instrument":[],'\
                   '"isalbumartist":false,"label":"[Missing]","mood":[],"musicbrainzartistid":["Artist Tag Missing"],'\
                   '"sortname":"[Missing Tag]","style":[],"thumbnail":"","type":"","yearsactive":[]}}}'
        expected_artist = Types::Audio::AudioDetailsArtist.new('[Missing]', 1, '', false, '', '',
                                                               '', '', '', '', [],
                                                               false, [], ['Artist Tag Missing'], [], [],
                                                               '[Missing Tag]', nil, [], '', [],
                                                               nil, '', [], '', '', '[Missing]')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_artist_details(1) })
        expected = create_kodi_response(1, expected_artist)
        assert_equal(expected, actual)
      end

      def test_get_artists
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetArtists","params":{"albumartistsonly":null,'\
               '"properties":["art","born","compilationartist","dateadded","datemodified","datenew","description",'\
               '"died","disambiguation","disbanded","fanart","formed","gender","genre","instrument","isalbumartist",'\
               '"mood","musicbrainzartistid","roles","songgenres","sortname","sourceid","style","thumbnail","type",'\
               '"yearsactive"],"limits":{"start":0,"end":50},"sort":{"ignorearticle":false,"method":"none",'\
               '"order":"ascending","useartistsortname":false},"allroles":false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"artists":[{"art":{},"artist":"artist1","artistid":3,'\
                   '"born":"","dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","description":"","died":"","disambiguation":"","disbanded":"",'\
                   '"fanart":"","formed":"","gender":"","genre":[],"instrument":[],"isalbumartist":true,'\
                   '"label":"label1","mood":[],"musicbrainzartistid":[""],"roles":[{"role":"Artist","roleid":1}],'\
                   '"songgenres":[{"genreid":1,"title":"Rock"}],"sortname":"","sourceid":[1],"style":[],'\
                   '"thumbnail":"","type":"","yearsactive":[]}],"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_song_genres = [Types::Audio::Genre.new(1, 'Rock')]
        expected_roles = [Types::Audio::AudioArtistRole.new('Artist', 1)]
        expected_artist = Types::Audio::AudioDetailsArtist.new('artist1', 3, '', nil, '', '',
                                                               '', '', '', '', [],
                                                               true, [], [''], expected_roles, expected_song_genres,
                                                               '', [1], [], '', [],
                                                               nil, '2021-11-08 21:02:32', [], '', '', 'label1')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_artists })
        expected = create_kodi_response(1, Types::Audio::GetArtistsReturned.new([expected_artist], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_available_art
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetAvailableArt",'\
               '"params":{"item":{"artistid":3},"arttype":""}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"availableart":[{"arttype":"arttype",'\
                   '"previewurl":"previewurl","url":"url"}]}}'
        expected_result = [Types::Audio::AvailableArt.new('arttype', 'previewurl', 'url')]
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_available_art_for_artist(3) })
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_get_available_art_types
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetAvailableArtTypes",'\
               '"params":{"item":{"artistid":3}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"availablearttypes":["arttype1", "arttype2"]}}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_available_art_types_for_artist(3) })
        assert_equal(actual.result[0], 'arttype1')
        assert_equal(actual.result[1], 'arttype2')
      end

      def test_get_genres
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetGenres","params":{"properties":["sourceid",'\
               '"thumbnail","title"],"limits":{"start":0,"end":50},"sort":{"ignorearticle":false,"method":"none",'\
               '"order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"genres":[{"genreid":1,"label":"Rock","sourceid":[1],'\
                   '"thumbnail":"","title":"Rock"}],"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_genres = [Types::Library::LibraryDetailsGenre.new(1, [1], '', 'Rock', 'Rock')]
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_genres })
        expected = create_kodi_response(1, Types::Audio::GetGenresReturned.new(expected_genres, expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_properties
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetProperties","params":{'\
               '"properties":["albumslastadded","albumsmodified","artistlinksupdated","artistslastadded",'\
               '"artistsmodified","genreslastadded","librarylastcleaned","librarylastupdated","missingartistid",'\
               '"songslastadded","songsmodified"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"albumslastadded":"2021-11-18 00:42:55",'\
                   '"albumsmodified":"2021-11-18 00:42:55","artistlinksupdated":"",'\
                   '"artistslastadded":"2021-11-18 00:42:54","artistsmodified":"2021-11-18 00:42:54",'\
                   '"genreslastadded":"2021-11-18 00:42:54","librarylastcleaned":"2021-11-18 00:50:05",'\
                   '"librarylastupdated":"2021-11-18 00:42:55","missingartistid":1,'\
                   '"songslastadded":"2021-11-18 00:42:55","songsmodified":"2021-11-18 00:42:55"}}'
        expected_result = Types::Audio::PropertyValue.new('2021-11-18 00:42:55', '2021-11-18 00:42:55',
                                                          '', '2021-11-18 00:42:54', '2021-11-18 00:42:54',
                                                          '2021-11-18 00:42:54', '2021-11-18 00:50:05',
                                                          '2021-11-18 00:42:55', 1, '2021-11-18 00:42:55',
                                                          '2021-11-18 00:42:55')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_properties })
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_get_recently_added_albums
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetRecentlyAddedAlbums","params":{"properties":'\
               '["albumduration","albumlabel","albumstatus","art","artist","artistid","compilation","dateadded",'\
               '"datemodified","datenew","description","displayartist","fanart","genre","isboxset","lastplayed",'\
               '"mood","musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzreleasegroupid","originaldate",'\
               '"playcount","rating","releasedate","releasetype","songgenres","sortartist","sourceid","style","theme",'\
               '"thumbnail","title","totaldiscs","type","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"albums":[{"albumduration":2512,"albumid":2,"albumlabel":"",'\
                   '"albumstatus":"","art":{"thumb":"image:music@path/to/mp3"},"artist":["artist1"],"artistid":[3],'\
                   '"compilation":false,"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","description":"","displayartist":"artist1","fanart":"",'\
                   '"genre":["Rock"],"isboxset":false,"label":"label1","lastplayed":"","mood":["mood"],'\
                   '"musicbrainzalbumartistid":[""],"musicbrainzalbumid":"","musicbrainzreleasegroupid":"",'\
                   '"originaldate":"2008","playcount":0,"rating":0,"releasedate":"2008","releasetype":"album",'\
                   '"songgenres":[{"genreid":1,"title":"Rock"}],"sortartist":"","sourceid":[1],"style":[],"theme":[],'\
                   '"thumbnail":"image:music@path/to/mp3","title":"title1","totaldiscs":1,"type":"","userrating":0,'\
                   '"votes":0,"year":2008}],"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:music@path/to/mp3')
        expected_song_genres = [Types::Audio::Genre.new(1, 'Rock')]
        expected_album = Types::Audio::AudioDetailsAlbum.new(2512, 2, '', '', expected_art,
                                                             ['artist1'], [3], false, '2021-11-08 21:02:32',
                                                             '2021-11-18 00:42:54', '2021-11-18 00:42:54', '', 'artist1',
                                                             '', ['Rock'], false, 'label1', '', ['mood'], [''],
                                                             '', '', '2008', 0, 0,
                                                             '2008', 'album', expected_song_genres, '', [1],
                                                             [], [], 'image:music@path/to/mp3', 'title1', 1,
                                                             '', 0, 0, 2008)
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_recently_added_albums })
        expected = create_kodi_response(1, Types::Audio::GetAlbumsReturned.new([expected_album], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_recently_added_songs
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetRecentlyAddedSongs","params":{"albumlimit":100,'\
               '"properties":["album","albumartist","albumartistid","albumid","albumreleasetype","art","artist",'\
               '"artistid","bitrate","bpm","channels","comment","contributors","dateadded","datemodified","datenew",'\
               '"disc","disctitle","displayartist","displaycomposer","displayconductor","displaylyricist",'\
               '"displayorchestra","duration","fanart","file","genre","genreid","lastplayed","lyrics","mood",'\
               '"musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid",'\
               '"originaldate","playcount","rating","releasedate","samplerate","sortartist","sourceid","thumbnail",'\
               '"title","track","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":1,"start":0,"total":1},'\
                   '"songs":[{"album":"album1","albumartist":["artist1"],"albumartistid":[3],"albumid":2,'\
                   '"albumreleasetype":"album","art":{"thumb":"image:/path/to/mp3"},"artist":["artist1"],'\
                   '"artistid":[3],"bitrate":274,"bpm":0,"channels":2,"comment":"","contributors":[],'\
                   '"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","disc":1,"disctitle":"","displayartist":"artist1",'\
                   '"displaycomposer":"","displayconductor":"","displaylyricist":"","displayorchestra":"",'\
                   '"duration":190,"fanart":"","file":"/path/to/mp3","genre":["Rock"],"genreid":[1],'\
                   '"label":"label1","lastplayed":"","lyrics":"","mood":[],"musicbrainzalbumartistid":[],'\
                   '"musicbrainzalbumid":"","musicbrainzartistid":[],"musicbrainztrackid":"","originaldate":"2008",'\
                   '"playcount":0,"rating":0,"releasedate":"2008","samplerate":44100,"songid":2,"sortartist":"",'\
                   '"sourceid":[1],"thumbnail":"image://path/to/mp3","title":"title","track":1,"userrating":0,'\
                   '"votes":0,"year":2008}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:/path/to/mp3')
        expected_song = Types::Audio::AudioDetailsSong.new('album1', ['artist1'], [3], 2, 'album',
                                                           274, 0, 2, '', [],
                                                           1, '', '', '', '',
                                                           '', 190, '/path/to/mp3', [1], '',
                                                           '', [], [], '', 0,
                                                           44_100, 2, [1], 1, ['artist1'],
                                                           [3], 'artist1', [], '2008', 0,
                                                           '2008', '', 'title', 0, 0,
                                                           2008, expected_art, '2021-11-08 21:02:32', ['Rock'], '',
                                                           'image://path/to/mp3', 'label1')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_recently_added_songs })
        expected = create_kodi_response(1, Types::Audio::GetSongsReturned.new([expected_song], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_recently_played_albums
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetRecentlyPlayedAlbums","params":{"properties":'\
               '["albumduration","albumlabel","albumstatus","art","artist","artistid","compilation","dateadded",'\
               '"datemodified","datenew","description","displayartist","fanart","genre","isboxset","lastplayed",'\
               '"mood","musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzreleasegroupid","originaldate",'\
               '"playcount","rating","releasedate","releasetype","songgenres","sortartist","sourceid","style","theme",'\
               '"thumbnail","title","totaldiscs","type","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"albums":[{"albumduration":2512,"albumid":2,"albumlabel":"",'\
                   '"albumstatus":"","art":{"thumb":"image:music@path/to/mp3"},"artist":["artist1"],"artistid":[3],'\
                   '"compilation":false,"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","description":"","displayartist":"artist1","fanart":"",'\
                   '"genre":["Rock"],"isboxset":false,"label":"label1","lastplayed":"","mood":["mood"],'\
                   '"musicbrainzalbumartistid":[""],"musicbrainzalbumid":"","musicbrainzreleasegroupid":"",'\
                   '"originaldate":"2008","playcount":0,"rating":0,"releasedate":"2008","releasetype":"album",'\
                   '"songgenres":[{"genreid":1,"title":"Rock"}],"sortartist":"","sourceid":[1],"style":[],"theme":[],'\
                   '"thumbnail":"image:music@path/to/mp3","title":"title1","totaldiscs":1,"type":"","userrating":0,'\
                   '"votes":0,"year":2008}],"limits":{"end":1,"start":0,"total":1}}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:music@path/to/mp3')
        expected_song_genres = [Types::Audio::Genre.new(1, 'Rock')]
        expected_album = Types::Audio::AudioDetailsAlbum.new(2512, 2, '', '', expected_art,
                                                             ['artist1'], [3], false, '2021-11-08 21:02:32',
                                                             '2021-11-18 00:42:54', '2021-11-18 00:42:54', '', 'artist1',
                                                             '', ['Rock'], false, 'label1', '', ['mood'], [''],
                                                             '', '', '2008', 0, 0,
                                                             '2008', 'album', expected_song_genres, '', [1],
                                                             [], [], 'image:music@path/to/mp3', 'title1', 1,
                                                             '', 0, 0, 2008)
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_recently_played_albums })
        expected = create_kodi_response(1, Types::Audio::GetAlbumsReturned.new([expected_album], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_recently_played_songs
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetRecentlyPlayedSongs","params":{"albumlimit":100,'\
               '"properties":["album","albumartist","albumartistid","albumid","albumreleasetype","art","artist",'\
               '"artistid","bitrate","bpm","channels","comment","contributors","dateadded","datemodified","datenew",'\
               '"disc","disctitle","displayartist","displaycomposer","displayconductor","displaylyricist",'\
               '"displayorchestra","duration","fanart","file","genre","genreid","lastplayed","lyrics","mood",'\
               '"musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid",'\
               '"originaldate","playcount","rating","releasedate","samplerate","sortartist","sourceid","thumbnail",'\
               '"title","track","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":1,"start":0,"total":1},'\
                   '"songs":[{"album":"album1","albumartist":["artist1"],"albumartistid":[3],"albumid":2,'\
                   '"albumreleasetype":"album","art":{"thumb":"image:/path/to/mp3"},"artist":["artist1"],'\
                   '"artistid":[3],"bitrate":274,"bpm":0,"channels":2,"comment":"","contributors":[],'\
                   '"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","disc":1,"disctitle":"","displayartist":"artist1",'\
                   '"displaycomposer":"","displayconductor":"","displaylyricist":"","displayorchestra":"",'\
                   '"duration":190,"fanart":"","file":"/path/to/mp3","genre":["Rock"],"genreid":[1],'\
                   '"label":"label1","lastplayed":"","lyrics":"","mood":[],"musicbrainzalbumartistid":[],'\
                   '"musicbrainzalbumid":"","musicbrainzartistid":[],"musicbrainztrackid":"","originaldate":"2008",'\
                   '"playcount":0,"rating":0,"releasedate":"2008","samplerate":44100,"songid":2,"sortartist":"",'\
                   '"sourceid":[1],"thumbnail":"image://path/to/mp3","title":"title","track":1,"userrating":0,'\
                   '"votes":0,"year":2008}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:/path/to/mp3')
        expected_song = Types::Audio::AudioDetailsSong.new('album1', ['artist1'], [3], 2, 'album',
                                                           274, 0, 2, '', [],
                                                           1, '', '', '', '',
                                                           '', 190, '/path/to/mp3', [1], '',
                                                           '', [], [], '', 0,
                                                           44_100, 2, [1], 1, ['artist1'],
                                                           [3], 'artist1', [], '2008', 0,
                                                           '2008', '', 'title', 0, 0,
                                                           2008, expected_art, '2021-11-08 21:02:32', ['Rock'], '',
                                                           'image://path/to/mp3', 'label1')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_recently_played_songs })
        expected = create_kodi_response(1, Types::Audio::GetSongsReturned.new([expected_song], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_roles
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetRoles","params":{"properties":["title"],'\
               '"limits":{"start":0,"end":50},"sort":{"ignorearticle":false,"method":"none","order":"ascending",'\
               '"useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":1,"start":0,"total":1},'\
                   '"roles":[{"title": "title", "roleid":1}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_role = Types::Audio::AudioDetailsRole.new(1, 'title', nil)
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_roles })
        expected = create_kodi_response(1, Types::Audio::GetRolesReturned.new([expected_role], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_song_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetSongDetails","params":{"songid": 1,"properties":['\
               '"album","albumartist","albumartistid","albumid","albumreleasetype","art","artist",'\
               '"artistid","bitrate","bpm","channels","comment","contributors","dateadded","datemodified","datenew",'\
               '"disc","disctitle","displayartist","displaycomposer","displayconductor","displaylyricist",'\
               '"displayorchestra","duration","fanart","file","genre","genreid","lastplayed","lyrics","mood",'\
               '"musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid",'\
               '"originaldate","playcount","rating","releasedate","samplerate","sortartist","sourceid","thumbnail",'\
               '"title","track","userrating","votes","year"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"songdetails":{"album":"album1","albumartist":["artist1"],'\
                   '"albumartistid":[3],"albumid":2,"albumreleasetype":"album","art":{"thumb":"image:/path/to/mp3"},'\
                   '"artist":["artist1"],"artistid":[3],"bitrate":274,"bpm":0,"channels":2,"comment":"",'\
                   '"contributors":[],"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","disc":1,"disctitle":"","displayartist":"artist1",'\
                   '"displaycomposer":"","displayconductor":"","displaylyricist":"","displayorchestra":"",'\
                   '"duration":190,"fanart":"","file":"/path/to/mp3","genre":["Rock"],"genreid":[1],'\
                   '"label":"label1","lastplayed":"","lyrics":"","mood":[],"musicbrainzalbumartistid":[],'\
                   '"musicbrainzalbumid":"","musicbrainzartistid":[],"musicbrainztrackid":"","originaldate":"2008",'\
                   '"playcount":0,"rating":0,"releasedate":"2008","samplerate":44100,"songid":2,"sortartist":"",'\
                   '"sourceid":[1],"thumbnail":"image://path/to/mp3","title":"title","track":1,"userrating":0,'\
                   '"votes":0,"year":2008}}}'
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:/path/to/mp3')
        expected_song = Types::Audio::AudioDetailsSong.new('album1', ['artist1'], [3], 2, 'album',
                                                           274, 0, 2, '', [],
                                                           1, '', '', '', '',
                                                           '', 190, '/path/to/mp3', [1], '',
                                                           '', [], [], '', 0,
                                                           44_100, 2, [1], 1, ['artist1'],
                                                           [3], 'artist1', [], '2008', 0,
                                                           '2008', '', 'title', 0, 0,
                                                           2008, expected_art, '2021-11-08 21:02:32', ['Rock'], '',
                                                           'image://path/to/mp3', 'label1')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_song_details(1) })
        expected = create_kodi_response(1, expected_song)
        assert_equal(expected, actual)
      end

      def test_get_sources
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetSources","params":{'\
               '"properties":["file", "paths"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false}}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":1,"start":0,"total":1},'\
                   '"sources":[{"file":"file", "paths":["path1","path2"],"sourceid":1,"label":"label"}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_source = Types::Library::AudioDetailsSource.new('file', %w[path1 path2], 1,
                                                                 'label')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_sources })
        expected = create_kodi_response(1, Types::Audio::GetSourcesReturned.new([expected_source], expected_limits))
        assert_equal(expected, actual)
      end

      def test_get_songs
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.GetSongs","params":{'\
               '"properties":["album","albumartist","albumartistid","albumid","albumreleasetype","art","artist",'\
               '"artistid","bitrate","bpm","channels","comment","contributors","dateadded","datemodified","datenew",'\
               '"disc","disctitle","displayartist","displaycomposer","displayconductor","displaylyricist",'\
               '"displayorchestra","duration","fanart","file","genre","genreid","lastplayed","lyrics","mood",'\
               '"musicbrainzalbumartistid","musicbrainzalbumid","musicbrainzartistid","musicbrainztrackid",'\
               '"originaldate","playcount","rating","releasedate","samplerate","sortartist","sourceid","thumbnail",'\
               '"title","track","userrating","votes","year"],"limits":{"start":0,"end":50},'\
               '"sort":{"ignorearticle":false,"method":"none","order":"ascending","useartistsortname":false},'\
               '"includesingles":true, "allroles":true, "singlesonly":false}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"limits":{"end":1,"start":0,"total":1},'\
                   '"songs":[{"album":"album1","albumartist":["artist1"],"albumartistid":[3],"albumid":2,'\
                   '"albumreleasetype":"album","art":{"thumb":"image:/path/to/mp3"},"artist":["artist1"],'\
                   '"artistid":[3],"bitrate":274,"bpm":0,"channels":2,"comment":"","contributors":[],'\
                   '"dateadded":"2021-11-08 21:02:32","datemodified":"2021-11-18 00:42:54",'\
                   '"datenew":"2021-11-18 00:42:54","disc":1,"disctitle":"","displayartist":"artist1",'\
                   '"displaycomposer":"","displayconductor":"","displaylyricist":"","displayorchestra":"",'\
                   '"duration":190,"fanart":"","file":"/path/to/mp3","genre":["Rock"],"genreid":[1],'\
                   '"label":"label1","lastplayed":"","lyrics":"","mood":[],"musicbrainzalbumartistid":[],'\
                   '"musicbrainzalbumid":"","musicbrainzartistid":[],"musicbrainztrackid":"","originaldate":"2008",'\
                   '"playcount":0,"rating":0,"releasedate":"2008","samplerate":44100,"songid":2,"sortartist":"",'\
                   '"sourceid":[1],"thumbnail":"image://path/to/mp3","title":"title","track":1,"userrating":0,'\
                   '"votes":0,"year":2008}]}}'
        expected_limits = Types::List::ListLimitsReturned.new(0, 1, 1)
        expected_art = Types::Media::MediaArtwork.new(nil, nil, nil, 'image:/path/to/mp3')
        expected_song = Types::Audio::AudioDetailsSong.new('album1', ['artist1'], [3], 2, 'album',
                                                           274, 0, 2, '', [],
                                                           1, '', '', '', '',
                                                           '', 190, '/path/to/mp3', [1], '',
                                                           '', [], [], '', 0,
                                                           44_100, 2, [1], 1, ['artist1'],
                                                           [3], 'artist1', [], '2008', 0,
                                                           '2008', '', 'title', 0, 0,
                                                           2008, expected_art, '2021-11-08 21:02:32', ['Rock'], '',
                                                           'image://path/to/mp3', 'label1')
        actual = run_test('audio_library', post, response, ->(mod) { mod.get_songs })
        expected = create_kodi_response(1, Types::Audio::GetSongsReturned.new([expected_song], expected_limits))
        assert_equal(expected, actual)
      end

      def test_set_album_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.SetAlbumDetails","params":{"albumid":1}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.set_album_details(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_artist_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.SetArtistDetails","params":{"artistid":1}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.set_artist_details(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_song_details
        post = '{"id":1,"jsonrpc":"2.0","method":"AudioLibrary.SetSongDetails","params":{"songid":1}}'
        response = '{"id":1,"jsonrpc":"2.0","result":"OK"}'
        actual = run_test('audio_library', post, response, ->(mod) { mod.set_song_details(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
