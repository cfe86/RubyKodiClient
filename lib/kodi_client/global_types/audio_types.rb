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

        def audio_details_base_by_hash(hash)
          audio_details_base(Types::Media::MediaArtwork.create(hash['art']), hash['date_added'], hash['genre'],
                             *Creatable.hash_to_arr(hash, %w[fan_art thumbnail label]))
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

        def audio_details_media_by_hash(hash)
          audio_details_media(hash['artist'], hash['artistid'], hash['displayartist'], hash['musicbrainzalbumartistid'],
                              hash['originaldate'], hash['rating'], hash['releasedate'], hash['sortartist'],
                              hash['title'], hash['userrating'], hash['votes'], hash['year'],
                              *Creatable.hash_to_arr(hash, %w[art date_added genre fan_art thumbnail label]))
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
    end
  end
end
