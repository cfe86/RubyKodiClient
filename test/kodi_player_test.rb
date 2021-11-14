# frozen_string_literal: true

require 'minitest/autorun'
require 'kodi_test_helper'

module KodiClient
  module Modules
    class KodiPlayerTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Open", "params": {"item":{"file":"file_url"},"options":{}}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test(Player, post, response, ->(mod) { mod.player_open('file_url') })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_add_subtitle
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.AddSubtitle",'\
               '"params": {"playerid":1,"subtitle":"path/to/subtitle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(Player, post, response, ->(mod) { mod.add_subtitle(1, 'path/to/subtitle') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_player_open
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Open", "params": {"item":{"file":"file_url"},"options":{}}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(Player, post, response, ->(mod) { mod.player_open('file_url') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_get_active_players
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetActivePlayers", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0", "result":[{"playerid":1,"playertype":"internal","type":"video"}]}'
        actual = run_test(Player, post, response, ->(mod) { mod.get_active_players })
        expected = create_kodi_response(1, [Types::Player::Player.new({ 'playerid' => 1,
                                                                        'playertype' => 'internal',
                                                                        'type' => 'video' })])
        assert_equal(expected, actual)
      end

      def test_get_item
        post = '{"id":1,"jsonrpc":"2.0","method":"Player.GetItem","params":{"playerid":1,"properties":["album"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"item":{"album":"","art":{},"artist":[],"cast":[],"country":[],'\
                   '"dateadded":"","director":[],"episode":-1,"episodeguide":"","fanart":"",'\
                   '"file":"http://upnp/%25/62696EF5EB0A713E05BD988F205A9EBE/movie.mkv","firstaired":"","genre":[],'\
                   '"imdbnumber":"","label":"movie.mkv","lastplayed":"2018-06-16 20:06:29","mpaa":"",'\
                   '"originaltitle":"","playcount":1,"plot":"","plotoutline":"","premiered":"","productioncode":"",'\
                   '"rating":0,"resume":{"position":0,"total":0},"runtime":8037,"season":-1,"set":"","setid":-1,'\
                   '"showlink":[],"showtitle":"","sorttitle":"","specialsortepisode":-1,"specialsortseason":-1,'\
                   '"streamdetails":{"audio":[{"channels":6,"codec":"ac3","language":""}],"subtitle":[],'\
                   '"video":[{"aspect":2.3684210777282714844,"codec":"mpeg4","duration":8037,"height":304,'\
                   '"language":"","stereomode":"","width":720}]},"studio":[],"tag":[],"tagline":"","thumbnail":"",'\
                   '"title":"","top250":0,"track":-1,"trailer":"","tvshowid":-1,"type":"unknown","userrating":0,'\
                   '"votes":"0","writer":[],"year":1601}}}'
        actual = run_test(Player, post, response, ->(mod) { mod.get_item(1, [Types::List::ListFieldsAll::ALBUM]) })
        expected_result = { 'album' => '', 'art' => {}, 'artist' => [], 'cast' => [], 'country' => [],
                            'dateadded' => '', 'director' => [], 'episode' => -1, 'episodeguide' => '', 'fanart' => '',
                            'file' => 'http://upnp/%25/62696EF5EB0A713E05BD988F205A9EBE/movie.mkv', 'firstaired' => '',
                            'genre' => [], 'imdbnumber' => '', 'label' => 'movie.mkv',
                            'lastplayed' => '2018-06-16 20:06:29', 'mpaa' => '', 'originaltitle' => '',
                            'playcount' => 1, 'plot' => '', 'plotoutline' => '', 'premiered' => '',
                            'productioncode' => '', 'rating' => 0, 'resume' => { 'position' => 0, 'total' => 0 },
                            'runtime' => 8037, 'season' => -1, 'set' => '', 'setid' => -1, 'showlink' => [],
                            'showtitle' => '', 'sorttitle' => '', 'specialsortepisode' => -1, 'specialsortseason' => -1,
                            'streamdetails' => { 'audio' => [{ 'channels' => 6, 'codec' => 'ac3', 'language' => '' }],
                                                 'subtitle' => [], 'video' => [{ 'aspect' => 2.3684210777282714844,
                                                                                 'codec' => 'mpeg4', 'duration' => 8037,
                                                                                 'height' => 304, 'language' => '',
                                                                                 'stereomode' => '', 'width' => 720 }] },
                            'studio' => [], 'tag' => [], 'tagline' => '', 'thumbnail' => '', 'title' => '',
                            'top250' => 0, 'track' => -1, 'trailer' => '', 'tvshowid' => -1, 'type' => 'unknown',
                            'userrating' => 0, 'votes' => '0', 'writer' => [], 'year' => 1601 }
        expected = create_kodi_response(1, Types::List::ListItemAll.new(expected_result))
        assert_equal(expected, actual)
      end

      def test_get_players
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetPlayers", "params": {"media":"all"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":[{"name":"VideoPlayer","playsaudio":true,"playsvideo":true,'\
                   '"type":"video"},{"name":"PAPlayer","playsaudio":true,"playsvideo":false,"type":"music"}]}'
        actual = run_test(Player, post, response, ->(mod) { mod.get_players })
        expected_players = [{ 'name' => 'VideoPlayer', 'playsaudio' => true, 'playsvideo' => true, 'type' => 'video' },
                            { 'name' => 'PAPlayer', 'playsaudio' => true, 'playsvideo' => false, 'type' => 'music' }]
        expected = create_kodi_response(1, expected_players.map { |it| Types::Player::Player.new(it) })
        assert_equal(expected, actual)
      end

      def test_get_properties
        post = '{"id":1,"jsonrpc":"2.0","method":"Player.GetProperties","params":{"playerid":1,'\
               '"properties":["audiostreams","canchangespeed","canmove","canrepeat","canrotate","canseek",'\
               '"canshuffle","canzoom","currentaudiostream","currentsubtitle","currentvideostream","live","partymode",'\
               '"percentage","playlistid","position","repeat","shuffled","speed","subtitleenabled","subtitles","time",'\
               '"totaltime","type","videostreams"]}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"audiostreams":[{"bitrate":446087,"channels":6,"codec":"ac3",'\
                   '"index":0,"language":"ger","name":"AC3 5.1"}],"canchangespeed":true,"canmove":false,'\
                   '"canrepeat":true,"canrotate":false,"canseek":true,"canshuffle":true,"canzoom":false,'\
                   '"currentaudiostream":{"bitrate":446087,"channels":6,"codec":"ac3","index":0,"language":"ger",'\
                   '"name":"AC3 5.1"},"currentsubtitle":{"index":0,"language":"ger","name":"GER Full"},'\
                   '"currentvideostream":{"codec":"h264","height":534,"index":0,"language":"","name":"","width":1280},'\
                   '"live":false,"partymode":false,"percentage":0.13991507887840270996,"playlistid":1,"position":0,'\
                   '"repeat":"off","shuffled":false,"speed":1,"subtitleenabled":false,"subtitles":[{"index":0,'\
                   '"language":"ger","name":"GER Full"},{"index":1,"language":"eng","name":"ENG Full"}],'\
                   '"time":{"hours":0,"milliseconds":129,"minutes":0,"seconds":9},"totaltime":{"hours":1,'\
                   '"milliseconds":672,"minutes":48,"seconds":44},"type":"video","videostreams":[{"codec":"h264",'\
                   '"height":534,"index":0,"language":"","name":"","width":1280}]}}'
        actual = run_test(Player, post, response, ->(mod) { mod.get_properties(1) })
        expected_property = { 'audiostreams' => [{ 'bitrate' => 446_087, 'channels' => 6, 'codec' => 'ac3',
                                                   'index' => 0, 'language' => 'ger', 'name' => 'AC3 5.1' }],
                              'canchangespeed' => true, 'canmove' => false, 'canrepeat' => true, 'canrotate' => false,
                              'canseek' => true, 'canshuffle' => true, 'canzoom' => false,
                              'currentaudiostream' => { 'bitrate' => 446_087, 'channels' => 6, 'codec' => 'ac3',
                                                        'index' => 0, 'language' => 'ger', 'name' => 'AC3 5.1' },
                              'currentsubtitle' => { 'index' => 0, 'language' => 'ger', 'name' => 'GER Full' },
                              'currentvideostream' => { 'codec' => 'h264', 'height' => 534, 'index' => 0,
                                                        'language' => '', 'name' => '', 'width' => 1280 },
                              'live' => false, 'partymode' => false, 'percentage' => 0.13991507887840270996,
                              'playlistid' => 1, 'position' => 0, 'repeat' => 'off', 'shuffled' => false, 'speed' => 1,
                              'subtitleenabled' => false, 'subtitles' => [{ 'index' => 0, 'language' => 'ger',
                                                                            'name' => 'GER Full' },
                                                                          { 'index' => 1, 'language' => 'eng',
                                                                            'name' => 'ENG Full' }],
                              'time' => { 'hours' => 0, 'milliseconds' => 129, 'minutes' => 0, 'seconds' => 9 },
                              'totaltime' => { 'hours' => 1, 'milliseconds' => 672, 'minutes' => 48, 'seconds' => 44 },
                              'type' => 'video', 'videostreams' => [{ 'codec' => 'h264', 'height' => 534, 'index' => 0,
                                                                      'language' => '', 'name' => '',
                                                                      'width' => 1280 }] }
        expected = create_kodi_response(1, Types::Player::PropertyValue.new(expected_property))
        assert_equal(expected, actual)
      end

      def test_get_view_mode
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetViewMode", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"nonlinearstretch":false,"pixelratio":1.0,'\
                   '"verticalshift":0.0,"viewed":"normal","zoom":1.0}}'
        actual = run_test(Player, post, response, ->(mod) { mod.get_view_mode })
        expected_result = { 'nonlinearstretch' => false, 'pixelratio' => 1.0, 'verticalshift' => 0.0,
                            'viewed' => 'normal', 'zoom' => 1.0 }
        expected = create_kodi_response(1, Types::Player::PlayerViewMode.new(expected_result))
        assert_equal(expected, actual)
      end

      def test_go_to
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GoTo", "params": {"playerid": 1, "to": "next"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(Player, post, response, ->(mod) { mod.go_to(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_move
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Move", "params": {"playerid": 1, "direction": "up"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(Player, post, response, ->(mod) { mod.move(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_rotate
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Rotate", "params": {"playerid": 1, "value": "clockwise"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test(Player, post, response, ->(mod) { mod.rotate(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_play_pause
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.PlayPause", "params": {"playerid": 1, "play": "toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"speed":1}}'
        actual = run_test(Player, post, response, ->(mod) { mod.play_pause(1) })
        expected = create_kodi_response(1, 1)
        assert_equal(expected, actual)
      end
    end
  end
end
