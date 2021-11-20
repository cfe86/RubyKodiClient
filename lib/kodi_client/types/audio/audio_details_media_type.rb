# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Media https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Media
      module AudioDetailsMedia
        include AudioDetailsBase

        attr_reader :artist, :artist_id, :display_artist, :musicbrainz_album_artist_id, :original_date, :rating,
                    :release_date, :sort_artist, :title, :user_rating, :votes, :year

        def audio_details_media_mappings
          audio_details_base_mappings
        end

        def audio_details_media_by_hash(hash)
          audio_details_media(*Extensions::Creatable.hash_to_arr(hash, %w[artist artist_id display_artist
                                                                          musicbrainz_album_artist_id original_date
                                                                          rating release_date sort_artist title
                                                                          user_rating votes year art date_added
                                                                          genre fan_art thumbnail label],
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
    end
  end
end
