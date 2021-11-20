# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Artist https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Artist
      class AudioDetailsArtist
        include AudioDetailsBase
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :artist, :artist_id, :born, :compilation_artist, :description, :died, :disambiguation, :disbanded,
                    :formed, :gender, :instrument, :is_album_artist, :mood, :musicbrainz_artist_id, :roles, :song_genres,
                    :sort_name, :source_id, :style, :type, :years_active

        fields_to_map %w[artist artist_id born compilation_artist description died disambiguation disbanded
                         formed gender instrument is_album_artist mood musicbrainz_artist_id roles song_genres
                         sort_name source_id style type years_active art date_added genre fan_art thumbnail
                         label]

        type_mapping ['songgenres', Genre, true], ['art', Types::Media::MediaArtwork], ['roles', AudioArtistRole, true]

        def initialize(artist, artist_id, born, compilation_artist, description, died, disambiguation, disbanded,
                       formed, gender, instrument, is_album_artist, mood, musicbrainz_artist_id, roles, song_genres,
                       sort_name, source_id, style, type, years_active, art, date_added, genre, fan_art, thumbnail,
                       label)
          @artist = artist
          @artist_id = artist_id
          @born = born
          @compilation_artist = compilation_artist
          @description = description
          @died = died
          @disambiguation = disambiguation
          @disbanded = disbanded
          @formed = formed
          @gender = gender
          @instrument = instrument
          @is_album_artist = is_album_artist
          @mood = mood
          @musicbrainz_artist_id = musicbrainz_artist_id
          @roles = roles
          @song_genres = song_genres
          @sort_name = sort_name
          @source_id = source_id
          @style = style
          @type = type
          @years_active = years_active
          audio_details_base(art, date_added, genre, fan_art, thumbnail, label)
        end
      end
    end
  end
end
