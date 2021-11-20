# frozen_string_literal: true

module KodiClient
  module Types
    module List
      # List.Item.Base https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.Base
      module ListItemBase
        include Video::VideoDetailsFile
        include Audio::AudioDetailsMedia

        attr_reader :album, :album_artist, :album_artist_id, :album_id, :album_release_type, :album_status, :bit_rate,
                    :bpm, :cast, :channels, :comment, :compilation, :contributors, :country, :description, :disc,
                    :disc_title, :display_composer, :display_conductor, :display_lyricist, :display_orchestra,
                    :duration, :dyn_path, :episode, :episode_guide, :first_aired, :id, :imdb_number, :is_box_set,
                    :lyrics, :media_path, :mood, :mpaa, :musicbrainz_artist_id, :musicbrainz_track_id, :original_date,
                    :original_title, :plot_outline, :premiered, :production_code, :release_date, :release_type,
                    :sample_rate, :season, :set, :set_id, :show_link, :show_title, :sort_title, :special_sort_episode,
                    :special_sort_season, :studio, :style, :tag, :tag_line, :theme, :top250, :total_discs, :track,
                    :trailer, :tv_show_id, :type, :unique_id, :votes, :watched_episodes, :writer

        def list_item_base_mappings
          [
            ['cast', Video::VideoCast, true],
            ['contributors', Audio::AudioContributor, true],
            ['resume', Video::VideoResume],
            ['streamdetails', Video::StreamDetails],
            ['art', Media::MediaArtwork]
          ] + video_details_file_mappings + audio_details_media_mappings
        end

        def list_item_base_by_hash(hash)
          return nil if hash.nil?

          list_item_base(*Extensions::Creatable.hash_to_arr(
            hash, %w[album album_artist album_artist_id album_id album_release_type album_status bit_rate
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
                     rating sort_artist user_rating year genre], list_item_base_mappings
          ))
        end

        def list_item_base(album, album_artist, album_artist_id, album_id, album_release_type, album_status, bit_rate,
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
          @album = album
          @album_artist = album_artist
          @album_artist_id = album_artist_id
          @album_id = album_id
          @album_release_type = album_release_type
          @album_status = album_status
          @bit_rate = bit_rate
          @bpm = bpm
          @cast = cast
          @channels = channels
          @comment = comment
          @compilation = compilation
          @contributors = contributors
          @country = country
          @description = description
          @disc = disc
          @disc_title = disc_title
          @display_composer = display_composer
          @display_conductor = display_conductor
          @display_lyricist = display_lyricist
          @display_orchestra = display_orchestra
          @duration = duration
          @dyn_path = dyn_path
          @episode = episode
          @episode_guide = episode_guide
          @first_aired = first_aired
          @id = id
          @imdb_number = imdb_number
          @is_box_set = is_box_set
          @lyrics = lyrics
          @media_path = media_path
          @mood = mood
          @mpaa = mpaa
          @musicbrainz_artist_id = musicbrainz_artist_id
          @musicbrainz_track_id = musicbrainz_track_id
          @original_date = original_date
          @original_title = original_title
          @plot_outline = plot_outline
          @premiered = premiered
          @production_code = production_code
          @release_date = release_date
          @release_type = release_type
          @sample_rate = sample_rate
          @season = season
          @set = set
          @set_id = set_id
          @show_link = show_link
          @show_title = show_title
          @sort_title = sort_title
          @special_sort_episode = special_sort_episode
          @special_sort_season = special_sort_season
          @studio = studio
          @style = style
          @tag = tag
          @tag_line = tag_line
          @theme = theme
          @top250 = top250
          @total_discs = total_discs
          @track = track
          @trailer = trailer
          @tv_show_id = tv_show_id
          @type = type
          @unique_id = unique_id
          @votes = votes
          @watched_episodes = watched_episodes
          @writer = writer
          video_details_file(director, resume, runtime, stream_details, date_added, file, last_played, plot, title,
                             art, play_count, fan_art, thumbnail, label)
          audio_details_media(artist, artist_id, display_artist, musicbrainz_album_artist_id, original_date, rating,
                              release_date, sort_artist, title, user_rating, votes, year, art, date_added, genre,
                              fan_art, thumbnail, label)
        end
      end
    end
  end
end
