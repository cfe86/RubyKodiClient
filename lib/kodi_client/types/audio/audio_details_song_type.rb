# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Song https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Song
      class AudioDetailsSong
        include AudioDetailsMedia
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :album, :album_artist, :album_artist_id, :album_id, :album_release_type, :bitrate, :bpm, :channels,
                    :comment, :contributors, :disc, :disc_title, :display_composer, :display_conductor,
                    :display_lyricist, :display_orchestra, :duration, :file, :genre_id, :last_played, :lyrics, :mood,
                    :musicbrainz_artist_id, :musicbrainz_track_id, :play_count, :sample_rate, :song_id, :source_id,
                    :track

        type_mapping ['contributors', Types::Audio::AudioContributor, true], *audio_details_media_mappings

        fields_to_map %w[album album_artist album_artist_id album_id album_release_type bitrate bpm channels
                         comment contributors disc disc_title display_composer display_conductor display_lyricist
                         display_orchestra duration file genre_id last_played lyrics mood musicbrainz_artist_id
                         musicbrainz_track_id play_count sample_rate song_id source_id track
                         artist artist_id display_artist musicbrainz_album_artist_id original_date
                         rating release_date sort_artist title user_rating votes year
                         art date_added genre fan_art thumbnail label]

        def initialize(album, album_artist, album_artist_id, album_id, album_release_type, bitrate, bpm, channels,
                       comment, contributors, disc, disc_title, display_composer, display_conductor, display_lyricist,
                       display_orchestra, duration, file, genre_id, last_played, lyrics, mood, musicbrainz_artist_id,
                       musicbrainz_track_id, play_count, sample_rate, song_id, source_id, track,
                       artist, artist_id, display_artist, musicbrainz_album_artist_id, original_date,
                       rating, release_date, sort_artist, title, user_rating, votes, year,
                       art, date_added, genre, fan_art, thumbnail, label)
          @album = album
          @album_artist = album_artist
          @album_artist_id = album_artist_id
          @album_id = album_id
          @album_release_type = album_release_type
          @bitrate = bitrate
          @bpm = bpm
          @channels = channels
          @comment = comment
          @contributors = contributors
          @disc = disc
          @disc_title = disc_title
          @display_composer = display_composer
          @display_conductor = display_conductor
          @display_lyricist = display_lyricist
          @display_orchestra = display_orchestra
          @duration = duration
          @file = file
          @genre_id = genre_id
          @last_played = last_played
          @lyrics = lyrics
          @mood = mood
          @musicbrainz_artist_id = musicbrainz_artist_id
          @musicbrainz_track_id = musicbrainz_track_id
          @play_count = play_count
          @sample_rate = sample_rate
          @song_id = song_id
          @source_id = source_id
          @track = track
          audio_details_media(artist, artist_id, display_artist, musicbrainz_album_artist_id, original_date,
                              rating, release_date, sort_artist, title, user_rating, votes, year,
                              art, date_added, genre, fan_art, thumbnail, label)
        end
      end
    end
  end
end

