# frozen_string_literal: true

module KodiClient
  module Methods
    # contains all Kodi Application methods
    class AudioLibrary < KodiMethod

      CLEAN = 'AudioLibrary.Clean'
      EXPORT = 'AudioLibrary.Export'
      GET_ALBUM_DETAILS = 'AudioLibrary.GetAlbumDetails'
      GET_ALBUMS = 'AudioLibrary.GetAlbums'
      GET_ARTIST_DETAILS = 'AudioLibrary.GetArtistDetails'
      GET_ARTISTS = 'AudioLibrary.GetArtists'
      GET_AVAILABLE_ART = 'AudioLibrary.GetAvailableArt'
      GET_AVAILABLE_ART_TYPES = 'AudioLibrary.GetAvailableArtTypes'
      GET_GENRES = 'AudioLibrary.GetGenres'
      GET_PROPERTIES = 'AudioLibrary.GetProperties'
      GET_RECENTLY_ADDED_ALBUMS = 'AudioLibrary.GetRecentlyAddedAlbums'
      GET_RECENTLY_ADDED_SONGS = 'AudioLibrary.GetRecentlyAddedSongs'
      GET_RECENTLY_PLAYED_ALBUMS = 'AudioLibrary.GetRecentlyPlayedAlbums'
      GET_RECENTLY_PLAYED_SONGS = 'AudioLibrary.GetRecentlyPlayedSongs'
      GET_ROLES = 'AudioLibrary.GetRoles'
      GET_SONG_DETAILS = 'AudioLibrary.GetSongDetails'
      GET_SOURCES = 'AudioLibrary.GetSources'
      GET_SONGS = 'AudioLibrary.GetSongs'
      SCAN = 'AudioLibrary.Scan'
      SET_ALBUM_DETAILS = 'AudioLibrary.SetAlbumDetails'
      SET_ARTIST_DETAILS = 'AudioLibrary.SetArtistDetails'
      SET_SONG_DETAILS = 'AudioLibrary.SetSongDetails'

      def clean(show_dialogs = true, kodi_id = 1)
        request = KodiRequest.new(kodi_id, CLEAN, { 'showdialogs' => show_dialogs })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def scan(show_dialogs = true, kodi_id = 1)
        request = KodiRequest.new(kodi_id, SCAN, { 'showdialogs' => show_dialogs })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def export(path, kodi_id = 1)
        request = KodiRequest.new(kodi_id, EXPORT, { 'options' => { 'path' => path } })
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def get_album_details(album_id, properties = Types::Audio::AudioFieldsAlbum.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ALBUM_DETAILS, { 'albumid' => album_id, 'properties' => properties })
        json = invoke_api(request)
        album_details = json['result'].nil? ? nil : json['result']['albumdetails']
        json['result'] = Types::Audio::AudioDetailsAlbum.create(album_details)
        KodiResponse.new(json)
      end

      def get_albums(properties = Types::Audio::AudioFieldsAlbum.all_properties,
                     limits = Types::List::ListLimits.new(0, 50),
                     sort = Types::List::ListSort.new, include_singles = false, all_roles = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ALBUMS,
                                  { 'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h,
                                    'includesingles' => include_singles, 'allroles' => all_roles })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetAlbumsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_artist_details(artist_id, properties = Types::Audio::AudioFieldsArtist.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ARTIST_DETAILS, { 'artistid' => artist_id, 'properties' => properties })
        json = invoke_api(request)
        artist_details = json['result'].nil? ? nil : json['result']['artistdetails']
        json['result'] = Types::Audio::AudioDetailsArtist.create(artist_details)
        KodiResponse.new(json)
      end

      def get_artists(album_artists_only = nil, properties = Types::Audio::AudioFieldsArtist.all_properties,
                      limits = Types::List::ListLimits.new(0, 50),
                      sort = Types::List::ListSort.new, all_roles = false, kodi_id = 1)
        params = { 'albumartistsonly' => album_artists_only, 'properties' => properties,
                   'limits' => limits.to_h, 'sort' => sort.to_h, 'allroles' => all_roles }
        params['albumartistsonly'] = album_artists_only unless album_artists_only.nil?
        request = KodiRequest.new(kodi_id, GET_ARTISTS, params)
        json = invoke_api(request)
        json['result'] = Types::Audio::GetArtistsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_available_art_for_artist(artist_id, art_type = '', kodi_id = 1)
        get_available_art({ 'artistid' => artist_id }, art_type, kodi_id)
      end

      def get_available_art_for_album(artist_id, art_type = '', kodi_id = 1)
        get_available_art({ 'albumid' => artist_id }, art_type, kodi_id)
      end

      def get_available_art(id, art_type = '', kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_AVAILABLE_ART, { 'item' => id, 'arttype' => art_type })
        json = invoke_api(request)
        available_arts = json['result'].nil? ? nil : json['result']['availableart']
        json['result'] = Types::Audio::AvailableArt.create_list(available_arts)
        KodiResponse.new(json)
      end

      def get_available_art_types_for_artist(artist_id, kodi_id = 1)
        get_available_art_types({ 'artistid' => artist_id }, kodi_id)
      end

      def get_available_art_types_for_album(album_id, kodi_id = 1)
        get_available_art_types({ 'albumid' => album_id }, kodi_id)
      end

      def get_available_art_types(id, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_AVAILABLE_ART_TYPES, { 'item' => id })
        json = invoke_api(request)
        available_arts = json['result'].nil? ? [] : json['result']['availablearttypes']
        json['result'] = available_arts
        KodiResponse.new(json)
      end

      def get_genres(properties = Types::Library::LibraryFieldsGenre.all_properties,
                     limits = Types::List::ListLimits.new(0, 50),
                     sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_GENRES, { 'properties' => properties,
                                                         'limits' => limits.to_h,
                                                         'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetGenresReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_properties(properties = Types::Audio::PropertyName.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_PROPERTIES, { 'properties' => properties, })
        json = invoke_api(request)
        json['result'] = Types::Audio::PropertyValue.create(json['result'])
        KodiResponse.new(json)
      end

      def get_recently_added_albums(properties = Types::Audio::AudioFieldsAlbum.all_properties,
                                    limits = Types::List::ListLimits.new(0, 50),
                                    sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_RECENTLY_ADDED_ALBUMS,
                                  { 'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetAlbumsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_recently_added_songs(album_limit = 100, properties = Types::Audio::AudioFieldsSong.all_properties,
                                   limits = Types::List::ListLimits.new(0, 50),
                                   sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_RECENTLY_ADDED_SONGS,
                                  { 'albumlimit' => album_limit,
                                    'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetSongsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_recently_played_albums(properties = Types::Audio::AudioFieldsAlbum.all_properties,
                                     limits = Types::List::ListLimits.new(0, 50),
                                     sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_RECENTLY_PLAYED_ALBUMS,
                                  { 'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetAlbumsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_recently_played_songs(album_limit = 100, properties = Types::Audio::AudioFieldsSong.all_properties,
                                    limits = Types::List::ListLimits.new(0, 50),
                                    sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_RECENTLY_PLAYED_SONGS,
                                  { 'albumlimit' => album_limit,
                                    'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetSongsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_roles(properties = Types::Audio::AudioFieldsRole.all_properties,
                    limits = Types::List::ListLimits.new(0, 50),
                    sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_ROLES, { 'properties' => properties,
                                                        'limits' => limits.to_h,
                                                        'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetRolesReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_song_details(song_id, properties = Types::Audio::AudioFieldsSong.all_properties, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_SONG_DETAILS, { 'songid' => song_id, 'properties' => properties })
        json = invoke_api(request)
        song_details = json['result'].nil? ? nil : json['result']['songdetails']
        json['result'] = Types::Audio::AudioDetailsSong.create(song_details)
        KodiResponse.new(json)
      end

      def get_sources(properties = Types::Library::LibraryFieldsSource.all_properties,
                      limits = Types::List::ListLimits.new(0, 50),
                      sort = Types::List::ListSort.new, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_SOURCES,
                                  { 'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetSourcesReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def get_songs(properties = Types::Audio::AudioFieldsSong.all_properties,
                    limits = Types::List::ListLimits.new(0, 50),
                    sort = Types::List::ListSort.new, include_singles = true, all_roles = true,
                    singles_only = false, kodi_id = 1)
        request = KodiRequest.new(kodi_id, GET_SONGS,
                                  { 'properties' => properties,
                                    'limits' => limits.to_h,
                                    'sort' => sort.to_h, 'includesingles' => include_singles, 'allroles' => all_roles,
                                    'singlesonly' => singles_only })
        json = invoke_api(request)
        json['result'] = Types::Audio::GetSongsReturned.create(json['result'])
        KodiResponse.new(json)
      end

      def set_album_details(album_id, title = nil, artist = nil, description = nil, genre = nil, theme = nil,
                            mood = nil, style = nil, type = nil, album_label = nil, rating = nil, year = nil,
                            user_rating = nil, votes = nil, musicbrainz_album_id = nil,
                            musicbrainz_release_group_id = nil, sort_artist = nil, display_artist = nil,
                            musicbrainz_album_artist_id = nil, art = nil, is_box_set = nil, release_date = nil,
                            original_date = nil, kodi_id = 1)
        params = { 'albumid' => album_id }
        params['title'] = title unless title.nil?
        params['artist'] = artist unless artist.nil?
        params['description'] = description unless description.nil?
        params['genre'] = genre unless genre.nil?
        params['theme'] = theme unless theme.nil?
        params['mood'] = mood unless mood.nil?
        params['style'] = style unless style.nil?
        params['type'] = type unless type.nil?
        params['albumlabel'] = album_label unless album_label.nil?
        params['rating'] = rating unless rating.nil?
        params['year'] = year unless year.nil?
        params['userrating'] = user_rating unless user_rating.nil?
        params['votes'] = votes unless votes.nil?
        params['musicbrainzalbumid'] = musicbrainz_album_id unless musicbrainz_album_id.nil?
        params['musicbrainzreleasegroupid'] = musicbrainz_release_group_id unless musicbrainz_release_group_id.nil?
        params['sortartist'] = sort_artist unless sort_artist.nil?
        params['displayartist'] = display_artist unless display_artist.nil?
        params['musicbrainzalbumartistid'] = musicbrainz_album_artist_id unless musicbrainz_album_artist_id.nil?
        params['art'] = art.to_h unless art.nil?
        params['isboxset'] = is_box_set unless is_box_set.nil?
        params['releasedate'] = release_date unless release_date.nil?
        params['originaldate'] = original_date unless original_date.nil?

        request = KodiRequest.new(kodi_id, SET_ALBUM_DETAILS, params)
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_artist_details(artist_id, artist = nil, instrument = nil, style = nil, mood = nil, born = nil,
                             formed = nil, description = nil, genre = nil, died = nil, disbanded = nil,
                             years_active = nil, musicbrainz_artist_id = nil, sort_name = nil, type = nil,
                             gender = nil, disambiguation = nil, art = nil, kodi_id = 1)
        params = { 'artistid' => artist_id }
        params['artist'] = artist unless artist.nil?
        params['instrument'] = instrument unless instrument.nil?
        params['style'] = style unless style.nil?
        params['mood'] = mood unless mood.nil?
        params['born'] = born unless born.nil?
        params['formed'] = formed unless formed.nil?
        params['description'] = description unless description.nil?
        params['genre'] = genre unless genre.nil?
        params['died'] = died unless died.nil?
        params['disbanded'] = disbanded unless disbanded.nil?
        params['yearsactive'] = years_active unless years_active.nil?
        params['musicbrainzartistid'] = musicbrainz_artist_id unless musicbrainz_artist_id.nil?
        params['sortname'] = sort_name unless sort_name.nil?
        params['type'] = type unless type.nil?
        params['gender'] = gender unless gender.nil?
        params['disambiguation'] = disambiguation unless disambiguation.nil?
        params['art'] = art.to_h unless art.nil?
        request = KodiRequest.new(kodi_id, SET_ARTIST_DETAILS, params)
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      def set_song_details(song_id, title = nil, artist = nil, genre = nil, year = nil, rating = nil, track = nil,
                           disc = nil, duration = nil, comment = nil, musicbrainz_track_id = nil,
                           musicbrainz_artist_id = nil, play_count = nil, last_played = nil, user_rating = nil,
                           votes = nil, display_artist = nil, sort_artist = nil, mood = nil, art = nil,
                           release_date = nil, original_date = nil, bpm = nil, kodi_id = 1)
        params = { 'songid' => song_id }
        params['title'] = title unless title.nil?
        params['artist'] = artist unless artist.nil?
        params['genre'] = genre unless genre.nil?
        params['year'] = year unless year.nil?
        params['rating'] = rating unless rating.nil?
        params['track'] = track unless track.nil?
        params['disc'] = disc unless disc.nil?
        params['duration'] = duration unless duration.nil?
        params['comment'] = comment unless comment.nil?
        params['musicbrainztrackid'] = musicbrainz_track_id unless musicbrainz_track_id.nil?
        params['musicbrainzartistid'] = musicbrainz_artist_id unless musicbrainz_artist_id.nil?
        params['playcount'] = play_count unless play_count.nil?
        params['lastplayed'] = last_played unless last_played.nil?
        params['userrating'] = user_rating unless user_rating.nil?
        params['votes'] = votes unless votes.nil?
        params['displayartist'] = display_artist unless display_artist.nil?
        params['sortartist'] = sort_artist unless sort_artist.nil?
        params['mood'] = mood unless mood.nil?
        params['art'] = art.to_h unless art.nil?
        params['releasedate'] = release_date unless release_date.nil?
        params['originaldate'] = original_date unless original_date.nil?
        params['bpm'] = bpm unless bpm.nil?

        request = KodiRequest.new(kodi_id, SET_SONG_DETAILS, params)
        json = invoke_api(request)
        KodiResponse.new(json)
      end

      private :get_available_art, :get_available_art_types
    end
  end
end
