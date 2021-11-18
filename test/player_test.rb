# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class PlayerTests < Minitest::Test
      include KodiClient::Test

      def test_error
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Open", "params": {"item":{"file":"file_url"},"options":{}}}'
        response = '{"error":{"code":-32601,"message":"Method not found."},"id":1,"jsonrpc":"2.0"}'
        actual = run_test('player', post, response, ->(mod) { mod.player_open('file_url') })
        expected = create_kodi_response(1, nil, -32_601, 'Method not found.')
        assert_equal(expected, actual)
      end

      def test_add_subtitle
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.AddSubtitle",'\
               '"params": {"playerid":1,"subtitle":"path/to/subtitle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.add_subtitle(1, 'path/to/subtitle') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_player_open
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Open", "params": {"item":{"file":"file_url"},"options":{}}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.player_open('file_url') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_get_active_players
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetActivePlayers", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0", "result":[{"playerid":1,"playertype":"internal","type":"video"}]}'
        actual = run_test('player', post, response, ->(mod) { mod.get_active_players })
        expected_player = Types::Player::Player.new(1, 'internal', 'video', nil, nil, nil)
        expected = create_kodi_response(1, [expected_player])
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
        actual = run_test('player', post, response, ->(mod) { mod.get_item(1, [Types::List::ListFieldsAll::ALBUM]) })
        expected_audio_stream = Types::Player::AudioStream.new(nil, 6, 'ac3', nil, nil, nil, nil, '', nil, nil)
        expected_video_stream = Types::Player::VideoStream.new('mpeg4', 304, nil, '', nil,
                                                               720, 8037, 2.3684210777282714844)
        expected_stream_details = Types::Video::Streams.new([expected_audio_stream], [], [expected_video_stream])
        expected_resume = Types::Video::VideoResume.new(0, 0)
        expected_result = Types::List::ListItemAll.new(nil, nil, nil, nil, nil, nil, nil,
                                                       nil, '', nil, nil, nil, nil,
                                                       nil, nil, nil, [], nil, nil, nil, [],
                                                       [], nil, nil, nil, nil, nil, nil,
                                                       nil, nil, nil, -1, '', '', nil,
                                                       '', nil, nil,
                                                       nil, nil, '', nil, nil, nil,
                                                       '', '', '', '', nil, nil,
                                                       nil, -1, '', -1, [], '', '',
                                                       -1, -1, [], nil, [], '',
                                                       nil, 0, nil, -1, '', -1, 'unknown', nil,
                                                       '0', nil, [], [], expected_resume, 8037, expected_stream_details,
                                                       '', 'http://upnp/%25/62696EF5EB0A713E05BD988F205A9EBE/movie.mkv',
                                                       '2018-06-16 20:06:29', '', '', nil, 1, '',
                                                       '', 'movie.mkv', [], nil, nil, nil, 0,
                                                       nil, 0, 1601, [])
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_get_players
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetPlayers", "params": {"media":"all"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":[{"name":"VideoPlayer","playsaudio":true,"playsvideo":true,'\
                   '"type":"video"},{"name":"PAPlayer","playsaudio":true,"playsvideo":false,"type":"music"}]}'
        actual = run_test('player', post, response, ->(mod) { mod.get_players })
        Types::Player::Player.new(nil, nil, 'video', 'VideoPlayer', true, true)
        expected_players = [Types::Player::Player.new(nil, nil, 'video', 'VideoPlayer', true, true),
                            Types::Player::Player.new(nil, nil, 'music', 'PAPlayer', true, false)]
        expected = create_kodi_response(1, expected_players)
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
        actual = run_test('player', post, response, ->(mod) { mod.get_properties(1) })
        expected_audio_streams = [Types::Player::AudioStream.new(446_087, 6, 'ac3', 0,
                                                                 nil, nil, nil, 'ger', 'AC3 5.1', nil)]
        expected_curr_audio_stream = Types::Player::AudioStream.new(446_087, 6, 'ac3', 0,
                                                                    nil, nil, nil, 'ger', 'AC3 5.1', nil)
        expected_subtitles = [Types::Player::Subtitle.new(0, nil, nil, nil, 'ger', 'GER Full'),
                              Types::Player::Subtitle.new(1, nil, nil, nil, 'eng', 'ENG Full')]
        expected_curr_subtitle = Types::Player::Subtitle.new(0, nil, nil, nil, 'ger', 'GER Full')
        expected_videos = [Types::Player::VideoStream.new('h264', 534, 0, '', '', 1280, nil, nil)]
        expected_curr_video = Types::Player::VideoStream.new('h264', 534, 0, '', '', 1280, nil, nil)
        expected_time = Types::Global::GlobalTime.new(0, 0, 9, 129)
        expected_total_time = Types::Global::GlobalTime.new(1, 48, 44, 672)
        expected_result = Types::Player::PropertyValue.new(expected_audio_streams, nil, true, false,
                                                           true, false, true, true, false,
                                                           expected_curr_audio_stream, expected_curr_subtitle,
                                                           expected_curr_video, false, false, 0.13991507887840270996,
                                                           1, 0, 'off', false, 1, false,
                                                           expected_subtitles, expected_time, expected_total_time,
                                                           'video', expected_videos)
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_get_view_mode
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GetViewMode", "params": {}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"nonlinearstretch":false,"pixelratio":1.0,'\
                   '"verticalshift":0.0,"viewmode":"normal","zoom":1.0}}'
        actual = run_test('player', post, response, ->(mod) { mod.get_view_mode })
        expected_result = Types::Player::PlayerViewMode.new(false, 1.0, 0.0, 'normal', 1.0)
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_go_to
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.GoTo", "params": {"playerid": 1, "to": "next"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.go_to(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_move
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Move", "params": {"playerid": 1, "direction": "up"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.move(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_rotate
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Rotate", "params": {"playerid": 1, "value": "clockwise"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.rotate(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_play_pause
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.PlayPause", "params": {"playerid": 1, "play": "toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"speed":1}}'
        actual = run_test('player', post, response, ->(mod) { mod.play_pause(1) })
        expected = create_kodi_response(1, 1)
        assert_equal(expected, actual)
      end

      def test_seek
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Seek", "params": {"playerid": 1, "value": 56.11}}'
        response = '{"id":1,"jsonrpc":"2.0","result":{"percentage":56.11011505126953125,"time":{"hours":1,'\
                   '"milliseconds":1,"minutes":1,"seconds":1},"totaltime":{"hours":1,"milliseconds":672,'\
                   '"minutes":48,"seconds":44}}}'
        actual = run_test('player', post, response, ->(mod) { mod.seek(1, 56.11) })
        expected_time = Types::Global::GlobalTime.new(1, 1, 1, 1)
        expected_total_time = Types::Global::GlobalTime.new(1, 48, 44, 672)
        expected_result = Types::Player::SeekReturned.new(56.11011505126953125, expected_time, expected_total_time)
        expected = create_kodi_response(1, expected_result)
        assert_equal(expected, actual)
      end

      def test_set_audio_stream
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetAudioStream", "params": {"playerid": 1, "stream": 1}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_audio_stream(1, 1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_party_mode
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetPartymode", "params": {"playerid": 1,'\
               '"partymode": "toggle"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_party_mode(1, Types::Global::Toggle::TOGGLE) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_repeat
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetRepeat", "params": {"playerid": 1,'\
               '"repeat": "all"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_repeat(1, Types::Player::PlayerRepeat::ALL) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_speed
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetSpeed", "params": {"playerid": 1,'\
               '"speed": "increment"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": { "speed": 2}}'
        actual = run_test('player', post, response, ->(mod) { mod.set_speed(1, 'increment') })
        expected = create_kodi_response(1, 2)
        assert_equal(expected, actual)
      end

      def test_set_subtitle
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetSubtitle", "params": {"playerid": 1,'\
               '"subtitle": "next", "enabled" : false}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_subtitle(1, 'next') })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_video_stream
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetVideoStream", "params": {"playerid": 1, "stream": 1}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_video_stream(1, 1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_set_view_mode
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.SetViewMode", "params": {"playerid": 1, "viewmode": "normal"}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.set_view_mode(1, Types::Player::ViewMode::NORMAL) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_stop
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Stop", "params": {"playerid": 1}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.stop(1) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end

      def test_zoom
        post = '{"jsonrpc":"2.0","id":1,"method":"Player.Zoom", "params": {"playerid": 1, "zoom": 4}}'
        response = '{"id":1,"jsonrpc":"2.0","result": "OK"}'
        actual = run_test('player', post, response, ->(mod) { mod.zoom(1, 4) })
        expected = create_kodi_response(1, 'OK')
        assert_equal(expected, actual)
      end
    end
  end
end
