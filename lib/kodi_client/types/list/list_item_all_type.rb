# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Item.All https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.All
      class ListItemAll
        include ListItemBase
        include Extensions::Comparable
        extend Extensions::Creatable
        extend ListItemBase

        attr_reader :channel, :channel_number, :channel_type, :end_time, :hidden, :locked, :start_time,
                    :sub_channel_number

        fields_to_map %w[channel channel_number channel_type end_time hidden locked start_time sub_channel_number
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

        def initialize(channel, channel_number, channel_type, end_time, hidden, locked, start_time, sub_channel_number,
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
          @channel = channel
          @channel_number = channel_number
          @channel_type = channel_type
          @end_time = end_time
          @hidden = hidden
          @locked = locked
          @start_time = start_time
          @sub_channel_number = sub_channel_number
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
