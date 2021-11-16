# frozen_string_literal: true

require 'kodi_client/global_types/media_types'
require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'

module KodiClient
  module Types
    module Audio

      # Audio.Contributor https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Contributors
      class AudioContributor
        include Comparable

        attr_reader :artist_id, :name, :role, :role_id

        def initialize(hash)
          @artist_id = hash['artistid']
          @name = hash['name']
          @role = hash['role']
          @role_id = hash['roleid']
        end

        def ==(other)
          compare(self, other)
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

        def audio_details_base(hash)
          @art = Types::Media::MediaArtwork.new(hash['art'])
          @date_added = hash['date_added']
          @genre = hash['genre']
          media_details_base(hash)
        end
      end

      # Audio.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Media
      module AudioDetailsMedia
        include AudioDetailsBase

        attr_reader :artist, :artist_id, :display_artist, :musicbrainz_albumartist_id, :original_date, :rating,
                    :release_date, :sort_artist, :title, :user_rating, :votes, :year

        def audio_details_media(hash)
          @artist = hash['artist']
          @artist_id = hash['artistid']
          @display_artist = hash['displayartist']
          @musicbrainz_albumartist_id = hash['musicbrainzalbumartistid']
          @original_date = hash['originaldate']
          @rating = hash['rating']
          @release_date = hash['releasedate']
          @sort_artist = hash['sortartist']
          @title = hash['title']
          @user_rating = hash['userrating']
          @votes = hash['votes']
          @year = hash['year']
          audio_details_base(hash)
        end
      end
    end
  end
end
