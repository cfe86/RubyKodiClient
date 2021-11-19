# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Item.File https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.File
      class ListItemFile
        include ListItemBase
        include Extensions::Comparable
        extend Extensions::Creatable
        extend ListItemBase

        attr_reader :file, :file_type, :last_modified, :mime_type, :size

        fields_to_map %w[file_type last_modified mime_type size
                         album album_artist album_artist_id album_id album_release_type album_status bit_rate
                         bpm cast channels comment compilation contributors country description disc
                         disc_title display_composer display_conductor display_lyricist display_orchestra
                         duration dyn_path episode episode_guide first_aired id imdb_number is_box_set
                         lyrics media_path mood mpaa musicbrainz_artist_id musicbrainz_track_id original_date
                         original_title plot_outline premiered production_code release_date release_type
                         sample_rate season set set_id show_link show_title sort_title special_sort_episode
                         special_sort_season studio style tag tag_line theme top250 total_discs track
                         trailer tv_show_id type unique_id votes watched_episodes writer director resume
                         runtime stream_details date_added file last_played plot title art play_count
                         fan_art thumbnail label artist artist_id display_artist musicbrainz_album_artist_id
                         rating sort_artist user_rating year genre]

        def self.lazy_type_mapping
          list_item_base_mappings
        end

        def initialize(file_type, last_modified, mime_type, size,
                       album, album_artist, album_artist_id, album_id, album_release_type, album_status, bit_rate,
                       bpm, cast, channels, comment, compilation, contributors, country, description, disc,
                       disc_title, display_composer, display_conductor, display_lyricist, display_orchestra,
                       duration, dyn_path, episode, episode_guide, first_aired, id, imdb_number, is_box_set,
                       lyrics, media_path, mood, mpaa, musicbrainz_artist_id, musicbrainz_track_id, original_date,
                       original_title, plot_outline, premiered, production_code, release_date, release_type,
                       sample_rate, season, set, set_id, show_link, show_title, sort_title, special_sort_episode,
                       special_sort_season, studio, style, tag, tag_line, theme, top250, total_discs, track,
                       trailer, tv_show_id, type, unique_id, votes, watched_episodes, writer, director, resume,
                       runtime, stream_details, date_added, file, last_played, plot, title, art, play_count,
                       fan_art, thumbnail, label, artist, artist_id, display_artist, musicbrainz_album_artist_id,
                       rating, sort_artist, user_rating, year, genre)
          @file = file
          @file_type = file_type
          @last_modified = last_modified
          @mime_type = mime_type
          @size = size
          type = type.nil? ? 'unknown' : type
          list_item_base(album, album_artist, album_artist_id, album_id, album_release_type, album_status, bit_rate,
                         bpm, cast, channels, comment, compilation, contributors, country, description, disc,
                         disc_title, display_composer, display_conductor, display_lyricist, display_orchestra,
                         duration, dyn_path, episode, episode_guide, first_aired, id, imdb_number, is_box_set,
                         lyrics, media_path, mood, mpaa, musicbrainz_artist_id, musicbrainz_track_id, original_date,
                         original_title, plot_outline, premiered, production_code, release_date, release_type,
                         sample_rate, season, set, set_id, show_link, show_title, sort_title, special_sort_episode,
                         special_sort_season, studio, style, tag, tag_line, theme, top250, total_discs, track,
                         trailer, tv_show_id, type, unique_id, votes, watched_episodes, writer, director, resume,
                         runtime, stream_details, date_added, file, last_played, plot, title, art, play_count,
                         fan_art, thumbnail, label, artist, artist_id, display_artist, musicbrainz_album_artist_id,
                         rating, sort_artist, user_rating, year, genre)
        end
      end
    end
  end
end
