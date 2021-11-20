# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Album https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Album
      class AudioDetailsAlbum
        include AudioDetailsMedia
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :album_duration, :album_id, :album_label, :album_status, :compilation, :date_modified, :date_new,
                    :description, :is_box_set, :last_played, :mood, :musicbrainz_album_id, :musicbrainz_release_group_id,
                    :play_count, :release_type, :song_genres, :source_id, :style, :theme, :total_discs, :type

        fields_to_map %w[album_duration album_id album_label album_status art artist artist_id compilation date_added
                         date_modified date_new description display_artist fan_art genre is_box_set label last_played
                         mood musicbrainz_album_artist_id musicbrainz_album_id musicbrainz_release_group_id
                         original_date play_count rating release_date release_type song_genres sort_artist source_id
                         style theme thumbnail title total_discs type user_rating votes year]

        type_mapping ['songgenres', Genre, true], ['art', Types::Media::MediaArtwork]

        def initialize(album_duration, album_id, album_label, album_status, art, artist, artist_id, compilation,
                       date_added, date_modified, date_new, description, display_artist, fan_art, genre, is_box_set,
                       label, last_played, mood, musicbrainz_album_artist_id, musicbrainz_album_id,
                       musicbrainz_release_group_id, original_date, play_count, rating, release_date, release_type,
                       song_genres, sort_artist, source_id, style, theme, thumbnail, title, total_discs, type,
                       user_rating, votes, year)
          @album_duration = album_duration
          @album_id = album_id
          @album_label = album_label
          @album_status = album_status
          @compilation = compilation
          @date_modified = date_modified
          @date_new = date_new
          @description = description
          @is_box_set = is_box_set
          @last_played = last_played
          @mood = mood
          @musicbrainz_album_id = musicbrainz_album_id
          @musicbrainz_release_group_id = musicbrainz_release_group_id
          @play_count = play_count
          @release_type = release_type
          @song_genres = song_genres
          @source_id = source_id
          @style = style
          @theme = theme
          @total_discs = total_discs
          @type = type
          audio_details_media(artist, artist_id, display_artist, musicbrainz_album_artist_id, original_date,
                              rating, release_date, sort_artist, title, user_rating, votes, year,
                              art, date_added, genre, fan_art, thumbnail, label)
        end
      end
    end
  end
end
