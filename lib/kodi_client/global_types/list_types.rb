# frozen_string_literal: true

require 'kodi_client/util/comparable'
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

        def ==(other)
          compare(self, other)
        end
      end

      # List.LimitsReturned https://kodi.wiki/view/JSON-RPC_API/v12#List.LimitsReturned
      class ListLimitsReturned
        include Comparable

        attr_reader :list_start, :list_end, :total

        def initialize(hash)
          @list_start = hash['start']
          @list_end = hash['end']
          @total = hash['total']
        end

        def ==(other)
          compare(self, other)
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
                       sortOrder = SortOrder::ASCENDING, use_artist_sort_name = false)
          @ignore_article = ignore_article
          @method = method
          @order = SortOrder::ASCENDING
          @use_artist_sort_name = use_artist_sort_name
        end

        def ==(other)
          compare(self, other)
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

        def list_item_base(hash)
          @album = hash['album']
          @album_artist = hash['albumartist']
          @album_artist_id = hash['albumartistid']
          @album_id = hash['albumid']
          @album_release_type = hash['albumreleasetype']
          @album_status = hash['albumstatus']
          @bit_rate = hash['bitrate']
          @bpm = hash['bpm']
          @cast = hash['cast'].nil? ? [] : hash['cast'].map { |it| Types::Video::VideoCast.new(it) }
          @channels = hash['channels']
          @comment = hash['comment']
          @compilation = hash['compilation']
          @contributors = hash['contributors'].nil? ? [] : hash['contributors'].map { |it| Types::Audio::AudioContributor.new(it) }
          @country = hash['country']
          @description = hash['description']
          @disc = hash['disc']
          @disc_title = hash['disctitle']
          @display_composer = hash['displaycomposer']
          @display_conductor = hash['displayconductor']
          @display_lyricist = hash['displaylyricist']
          @display_orchestra = hash['displayorchestra']
          @duration = hash['duration']
          @dyn_path = hash['dynpath']
          @episode = hash['episode']
          @episode_guide = hash['episodeguide']
          @first_aired = hash['firstaired']
          @id = hash['id']
          @imdb_number = hash['imdbnumber']
          @is_box_set = hash['isboxset']
          @lyrics = hash['lyrics']
          @media_path = hash['mediapath']
          @mood = hash['mood']
          @mpaa = hash['mpaa']
          @musicbrainz_artist_id = hash['musicbrainzartistid']
          @musicbrainz_track_id = hash['musicbrainztrackid']
          @original_date = hash['originaldate']
          @original_title = hash['originaltitle']
          @plot_outline = hash['plotoutline']
          @premiered = hash['premiered']
          @production_code = hash['productioncode']
          @release_date = hash['releasedate']
          @release_type = hash['releasetype']
          @sample_rate = hash['samplerate']
          @season = hash['season']
          @set = hash['set']
          @set_id = hash['setid']
          @show_link = hash['showlink']
          @show_title = hash['showtitle']
          @sort_title = hash['sorttitle']
          @special_sort_episode = hash['specialsortepisode']
          @special_sort_season = hash['specialsortseason']
          @studio = hash['studio']
          @style = hash['style']
          @tag = hash['tag']
          @tag_line = hash['tagline']
          @theme = hash['theme']
          @top250 = hash['top250']
          @total_discs = hash['totaldiscs']
          @track = hash['track']
          @trailer = hash['trailer']
          @tv_show_id = hash['tvshowid']
          @type = hash['type'].nil? ? 'unknown' : hash['type']
          @unique_id = hash['uniqueid']
          @votes = hash['votes']
          @watched_episodes = hash['watchedepisodes']
          @writer = hash['writer']
          video_details_file(hash)
          audio_details_media(hash)
        end
      end

      # List.Item.All https://kodi.wiki/view/JSON-RPC_API/v12#List.Item.All
      class ListItemAll
        include ListItemBase
        include Comparable

        attr_reader :channel, :channel_number, :channel_type, :end_time, :hidden, :locked, :start_time,
                    :sub_channel_number

        def initialize(hash)
          @channel = hash['channel']
          @channel_number = hash['channelnumber']
          @channel_type = hash['channeltype']
          @end_time = hash['endtime']
          @hidden = hash['hidden']
          @locked = hash['locked']
          @start_time = hash['starttime']
          @sub_channel_number = hash['subchannelnumber']
          list_item_base(hash)
        end

        def ==(other)
          compare(self, other)
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
