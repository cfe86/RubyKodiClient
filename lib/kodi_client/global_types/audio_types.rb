# frozen_string_literal: true

require 'kodi_client/global_types/media_types'
require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'

module KodiClient
  module Types
    module Audio

      # Audio.Contributor https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Contributors
      class AudioContributor
        include Comparable
        extend Creatable

        attr_reader :artist_id, :name, :role, :role_id

        def initialize(artist_id, name, role, role_id)
          @artist_id = artist_id
          @name = name
          @role = role
          @role_id = role_id
        end
      end

      # Audio.Album.ReleaseType https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Album.ReleaseType
      module AudioAlbumReleaseType
        extend Iterable

        ALBUM = 'album'
        SINGLE = 'single'
      end

      # Audio.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Base
      module AudioDetailsBase
        include Media::MediaDetailsBase

        attr_reader :art, :date_added, :genre

        def audio_details_base_mappings
          mappings = { 'art' => Creatable::CreateMap.new(Types::Media::MediaArtwork) }
          mappings.merge(media_details_base_mappings)
        end

        def audio_details_base_by_hash(hash)
          audio_details_base(*Creatable.hash_to_arr(hash, %w[art date_added genre fan_art thumbnail label]),
                             audio_details_base_mappings)
        end

        def audio_details_base(art, date_added, genre, fan_art, thumbnail, label)
          @art = art
          @date_added = date_added
          @genre = genre
          media_details_base(fan_art, thumbnail, label)
        end
      end

      # Audio.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Media
      module AudioDetailsMedia
        include AudioDetailsBase

        attr_reader :artist, :artist_id, :display_artist, :musicbrainz_album_artist_id, :original_date, :rating,
                    :release_date, :sort_artist, :title, :user_rating, :votes, :year

        def audio_details_media_mappings
          audio_details_base_mappings
        end

        def audio_details_media_by_hash(hash)
          audio_details_media(*Creatable.hash_to_arr(hash, %w[artist artist_id display_artist
                                                              musicbrainz_album_artist_id original_date rating
                                                              release_date sort_artist title user_rating votes year art
                                                              date_added genre fan_art thumbnail label],
                                                     audio_details_base_mappings))
        end

        def audio_details_media(artist, artist_id, display_artist, musicbrainz_album_artist_id, original_date,
                                rating, release_date, sort_artist, title, user_rating, votes, year,
                                art, date_added, genre, fan_art, thumbnail, label)
          @artist = artist
          @artist_id = artist_id
          @display_artist = display_artist
          @musicbrainz_album_artist_id = musicbrainz_album_artist_id
          @original_date = original_date
          @rating = rating
          @release_date = release_date
          @sort_artist = sort_artist
          @title = title
          @user_rating = user_rating
          @votes = votes
          @year = year
          audio_details_base(art, date_added, genre, fan_art, thumbnail, label)
        end
      end

      # Audio.Fields.Album https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Fields.Album
      module AudioFieldsAlbum
        extend Iterable

        #album id
        ALBUM_DURATION = 'albumduration'
        ALBUM_LABEL = 'albumlabel'
        ALBUM_STATUS = 'albumstatus'
        ART = 'art'
        ARTIST = 'artist'
        ARTIST_ID = 'artistid'
        COMPILATION = 'compilation'
        DATE_ADDED = 'dateadded'
        DATE_MODIFIED = 'datemodified'
        DATE_NEW = 'datenew'
        DESCRIPTION = 'description'
        DISPLAY_ARTIST = 'displayartist'
        FAN_ART = 'fanart'
        GENRE = 'genre'
        IS_BOX_SET = 'isboxset'
        LAST_PLAYED = 'lastplayed'
        MOOD = 'mood'
        MUSICBRAINZ_ALBUM_ARTIST_ID = 'musicbrainzalbumartistid'
        MUSICBRAINZ_ALBUM_ID = 'musicbrainzalbumid'
        MUSICBRAINZ_RELEASE_GROUP_ID = 'musicbrainzreleasegroupid'
        ORIGINAL_DATE = 'originaldate'
        PLAY_COUNT = 'playcount'
        RATING = 'rating'
        RELEASE_DATE = 'releasedate'
        RELEASE_TYPE = 'releasetype'
        SONG_GENRES = 'songgenres'
        SORT_ARTIST = 'sortartist'
        SOURCE_ID = 'sourceid'
        STYLE = 'style'
        THEME = 'theme'
        THUMBNAIL = 'thumbnail'
        TITLE = 'title'
        TOTAL_DISCS = 'totaldiscs'
        TYPE = 'type'
        USER_RATING = 'userrating'
        VOTES = 'votes'
        YEAR = 'year'
      end

      # Audio.Details.Genres https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Genres
      class Genre
        include Comparable
        extend Creatable

        attr_reader :genre_id, :title

        def initialize(genre_id, title)
          @genre_id = genre_id
          @title = title
        end
      end

      # Audio.Details.Album https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Album
      class DetailsAlbum
        include AudioDetailsMedia
        include Comparable
        extend Creatable

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

      # return type for AudioLibrary.GetAlbums
      class GetAlbumsReturned
        include Comparable
        extend Creatable

        attr_reader :albums, :limits

        def self.lazy_type_mapping
          {
            'albums' => Creatable::CreateMap.new(DetailsAlbum, true),
            'limits' => Creatable::CreateMap.new(List::ListLimitsReturned)
          }
        end

        def initialize(albums, limits)
          @albums = albums
          @limits = limits
        end
      end
    end
  end
end
