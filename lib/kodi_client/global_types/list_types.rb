# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/creatable'
require 'kodi_client/global_types/video_types'
require 'kodi_client/global_types/audio_types'

module KodiClient
  module Types
    module List

      # List.Limits https://kodi.wiki/view/JSON-RPC_API/v12#List.Limits
      class ListLimits
        include Comparable

        attr_reader :list_start, :list_end

        def initialize(list_start, list_end)
          @list_start = list_start
          @list_end = list_end
        end
      end

      # List.LimitsReturned https://kodi.wiki/view/JSON-RPC_API/v12#List.LimitsReturned
      class ListLimitsReturned
        include Comparable
        extend Creatable

        attr_reader :list_start, :list_end, :total

        fields_to_map %w[start end total]

        def initialize(list_start, list_end, total)
          @list_start = list_start
          @list_end = list_end
          @total = total
        end
      end

      # ascending/descending for sorting
      module SortOrder
        extend Iterable

        ASCENDING = 'ascending'
        DESCENDING = 'descending'
      end

      # List.Sort https://kodi.wiki/view/JSON-RPC_API/v12#List.Sort
      class ListSort
        include Comparable

        attr_reader :ignore_article, :method, :order, :use_artist_sort_name

        def initialize(ignore_article = false, method = ListSortMethod::NONE,
                       sort_order = SortOrder::ASCENDING, use_artist_sort_name = false)
          @ignore_article = ignore_article
          @method = method
          @order = sort_order
          @use_artist_sort_name = use_artist_sort_name
        end
      end

      # List.Fields.All https://kodi.wiki/view/JSON-RPC_API/v12#List.Fields.All
      module ListFieldsAll
        extend Iterable

        ALBUM = 'album'
        ALBUMARTIST = 'albumartist'
        ALBUMARTISTID = 'albumartistid'
        ALBUMID = 'albumid'
        ALBUMLABEL = 'albumlabel'
        ALBUMRELEASETYPE = 'albumreleasetype'
        ART = 'art'
        ARTIST = 'artist'
        ARTISTID = 'artistid'
        CAST = 'cast'
        CHANNEL = 'channel'
        CHANNELNUMBER = 'channelnumber'
        CHANNELTYPE = 'channeltype'
        COMMENT = 'comment'
        COMPILATION = 'compilation'
        CONTRIBUTORS = 'contributors'
        COUNTRY = 'country'
        DATEADDED = 'dateadded'
        DESCRIPTION = 'description'
        DIRECTOR = 'director'
        DISC = 'disc'
        DISPLAYARTIST = 'displayartist'
        DISPLAYCOMPOSER = 'displaycomposer'
        DISPLAYCONDUCTOR = 'displayconductor'
        DISPLAYLYRICIST = 'displaylyricist'
        DISPLAYORCHESTRA = 'displayorchestra'
        DURATION = 'duration'
        ENDTIME = 'endtime'
        EPISODE = 'episode'
        EPISODEGUIDE = 'episodeguide'
        FANART = 'fanart'
        FILE = 'file'
        FIRSTAIRED = 'firstaired'
        GENRE = 'genre'
        GENREID = 'genreid'
        HIDDEN = 'hidden'
        IMDBNUMBER = 'imdbnumber'
        LASTPLAYED = 'lastplayed'
        LOCKED = 'locked'
        LYRICS = 'lyrics'
        MOOD = 'mood'
        MPAA = 'mpaa'
        MUSICBRAINZALBUMARTISTID = 'musicbrainzalbumartistid'
        MUSICBRAINZALBUMID = 'musicbrainzalbumid'
        MUSICBRAINZARTISTID = 'musicbrainzartistid'
        MUSICBRAINZTRACKID = 'musicbrainztrackid'
        ORIGINALTITLE = 'originaltitle'
        PLAYCOUNT = 'playcount'
        PLOT = 'plot'
        PLOTOUTLINE = 'plotoutline'
        PREMIERED = 'premiered'
        PRODUCTIONCODE = 'productioncode'
        RATING = 'rating'
        RELEASETYPE = 'releasetype'
        RESUME = 'resume'
        RUNTIME = 'runtime'
        SEASON = 'season'
        SET = 'set'
        SETID = 'setid'
        SHOWLINK = 'showlink'
        SHOWTITLE = 'showtitle'
        SORTTITLE = 'sorttitle'
        SPECIALSORTEPISODE = 'specialsortepisode'
        SPECIALSORTSEASON = 'specialsortseason'
        STARTTIME = 'starttime'
        STREAMDETAILS = 'streamdetails'
        STUDIO = 'studio'
        STYLE = 'style'
        TAG = 'tag'
        TAGLINE = 'tagline'
        THEME = 'theme'
        THUMBNAIL = 'thumbnail'
        TITLE = 'title'
        TOP250 = 'top250'
        TRACK = 'track'
        TRAILER = 'trailer'
        TVSHOWID = 'tvshowid'
        UNIQUEID = 'uniqueid'
        USERRATING = 'userrating'
        VOTES = 'votes'
        WATCHEDEPISODES = 'watchedepisodes'
        WRITER = 'writer'
        YEAR = 'year'
      end

      # List.Fields.Files https://kodi.wiki/view/JSON-RPC_API/v12#List.Fields.Files
      module ListFieldFiles
        extend Iterable

        ALBUM = 'album'
        ALBUMARTIST = 'albumartist'
        ALBUMARTISTID = 'albumartistid'
        ALBUMID = 'albumid'
        ALBUMLABEL = 'albumlabel'
        ART = 'art'
        ARTIST = 'artist'
        ARTISTID = 'artistid'
        CAST = 'cast'
        COMMENT = 'comment'
        COUNTRY = 'country'
        DATEADDED = 'dateadded'
        DESCRIPTION = 'description'
        DIRECTOR = 'director'
        DISC = 'disc'
        DISPLAYARTIST = 'displayartist'
        DURATION = 'duration'
        EPISODE = 'episode'
        EPISODEGUIDE = 'episodeguide'
        FANART = 'fanart'
        FILE = 'file'
        FIRSTAIRED = 'firstaired'
        GENRE = 'genre'
        GENREID = 'genreid'
        IMDBNUMBER = 'imdbnumber'
        LASTMODIFIED = 'lastmodified'
        LASTPLAYED = 'lastplayed'
        LYRICS = 'lyrics'
        MIMETYPE = 'mimetype'
        MOOD = 'mood'
        MPAA = 'mpaa'
        MUSICBRAINZALBUMARTISTID = 'musicbrainzalbumartistid'
        MUSICBRAINZALBUMID = 'musicbrainzalbumid'
        MUSICBRAINZARTISTID = 'musicbrainzartistid'
        MUSICBRAINZTRACKID = 'musicbrainztrackid'
        ORIGINALTITLE = 'originaltitle'
        PLAYCOUNT = 'playcount'
        PLOT = 'plot'
        PLOTOUTLINE = 'plotoutline'
        PREMIERED = 'premiered'
        PRODUCTIONCODE = 'productioncode'
        RATING = 'rating'
        RESUME = 'resume'
        RUNTIME = 'runtime'
        SEASON = 'season'
        SET = 'set'
        SETID = 'setid'
        SHOWLINK = 'showlink'
        SHOWTITLE = 'showtitle'
        SIZE = 'size'
        SORTTITLE = 'sorttitle'
        SPECIALSORTEPISODE = 'specialsortepisode'
        SPECIALSORTSEASON = 'specialsortseason'
        STREAMDETAILS = 'streamdetails'
        STUDIO = 'studio'
        STYLE = 'style'
        TAG = 'tag'
        TAGLINE = 'tagline'
        THEME = 'theme'
        THUMBNAIL = 'thumbnail'
        TITLE = 'title'
        TOP250 = 'top250'
        TRACK = 'track'
        TRAILER = 'trailer'
        TVSHOWID = 'tvshowid'
        UNIQUEID = 'uniqueid'
        VOTES = 'votes'
        WATCHEDEPISODES = 'watchedepisodes'
        WRITER = 'writer'
        YEAR = 'year'
      end

      # File/Label tuple
      class FileLabel
        include Comparable
        extend Creatable

        attr_reader :file, :label

        def initialize(file, label)
          @file = file
          @label = label
        end
      end

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
          mappings = {
            'cast' => Creatable::CreateMap.new(Video::VideoCast, true),
            'contributors' => Creatable::CreateMap.new(Audio::AudioContributor, true),
            'resume' => Creatable::CreateMap.new(Video::VideoResume),
            'streamdetails' => Creatable::CreateMap.new(Video::Streams),
            'art' => Creatable::CreateMap.new(Media::MediaArtwork)
          }
          mappings.merge(video_details_file_mappings).merge(audio_details_media_mappings)
        end

        def list_item_base_by_hash(hash)
          return nil if hash.nil?

          list_item_base(*Creatable.hash_to_arr(
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

      # List.Item.All https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.All
      class ListItemAll
        include ListItemBase
        include Comparable
        extend Creatable
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

      # List.Item.File https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.File
      class ListItemFile
        include ListItemBase
        include Comparable
        extend Creatable
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

      # methods for list sorting
      module ListSortMethod
        extend Iterable

        NONE = 'none'
        LABEL = 'label'
        DATE = 'date'
        SIZE = 'size'
        FILE = 'file'
        PATH = 'path'
        DRIVE_TYPE = 'drivetype'
        TITLE = 'title'
        TRACK = 'track'
        TIME = 'time'
        ARTIST = 'artist'
        ALBUM = 'album'
        ALBUM_TYPE = 'albumtype'
        GENRE = 'genre'
        COUNTRY = 'country'
        YEAR = 'year'
        RATING = 'rating'
        USER_RATING = 'userrating'
        VOTES = 'votes'
        TOP_250 = 'top250'
        PROGRAM_COUNT = 'programcount'
        PLAYLIST = 'playlist'
        EPISODE = 'episode'
        SEASON = 'season'
        TOTAL_EPISODES = 'totalepisodes'
        WATCHED_EPISODES = 'watchedepisodes'
        TV_SHOW_STATUS = 'tvshowstatus'
        TV_SHOW_TITLE = 'tvshowtitle'
        SORT_TITLE = 'sorttitle'
        PRODUCTION_CODE = 'productioncode'
        MPAA = 'mpaa'
        STUDIO = 'studio'
        DATE_ADDED = 'dateadded'
        LAST_PLAYED = 'lastplayed'
        PLAY_COUNT = 'playcount'
        LISTENERS = 'listeners'
        BITRATE = 'bitrate'
        RANDOM = 'random'
        TOTAL_DISCS = 'totaldiscs'
        ORIGINAL_DATE = 'originaldate'
        BPM = 'bpm'
      end
    end
  end
end
