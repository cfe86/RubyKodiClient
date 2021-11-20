# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module KodiClient
  module Test
    class TypeCreatableTests < Minitest::Test
      include Types

      def test_details_album
        art = Media::MediaArtwork.new('banner', 'art', 'poster', 'thumb')
        song_genres = [Audio::Genre.new('genre_id', 'title')]
        album = Audio::AudioDetailsAlbum.new(
          'album_duration', 'album_id', 'album_label', 'album_status',
          art, ['artist'], ['artist_id'], false, 'date_added', 'date_modified', 'date_new',
          'description', 'display_artist', 'fan_art', ['genre'], false,
          'label', 'last_played', ['mood'], 'musicbrainz_album_artist_id',
          'musicbrainz_album_id', 'musicbrainz_release_group_id',
          'original_date', 0, 0.0, 'release_date',
          'release_type', song_genres, 'sort_artist', ['source_id'],
          ['style'], ['theme'], 'thumbnail', 'title', 1, 'type',
          0, 0, 2000
        )

        hash = { 'albumduration' => 'album_duration', 'albumid' => 'album_id', 'albumlabel' => 'album_label',
                 'albumstatus' => 'album_status',
                 'art' => { 'banner' => 'banner', 'fanart' => 'art', 'poster' => 'poster', 'thumb' => 'thumb' },
                 'artist' => ['artist'], 'artistid' => ['artist_id'], 'compilation' => false, 'dateadded' => 'date_added',
                 'datemodified' => 'date_modified', 'datenew' => 'date_new', 'description' => 'description',
                 'displayartist' => 'display_artist', 'fanart' => 'fan_art', 'genre' => ['genre'], 'isboxset' => false,
                 'label' => 'label', 'lastplayed' => 'last_played', 'mood' => ['mood'],
                 'musicbrainzalbumartistid' => 'musicbrainz_album_artist_id', 'musicbrainzalbumid' => 'musicbrainz_album_id',
                 'musicbrainzreleasegroupid' => 'musicbrainz_release_group_id', 'originaldate' => 'original_date',
                 'playcount' => 0, 'rating' => 0.0, 'releasedate' => 'release_date', 'releasetype' => 'release_type',
                 'songgenres' => [{ 'genreid' => 'genre_id', 'title' => 'title' }],
                 'sortartist' => 'sort_artist', 'sourceid' => ['source_id'], 'style' => ['style'], 'theme' => ['theme'],
                 'thumbnail' => 'thumbnail', 'title' => 'title', 'totaldiscs' => 1, 'type' => 'type', 'userrating' => 0,
                 'votes' => 0, 'year' => 2000 }

        album_hash = Audio::AudioDetailsAlbum.create(hash)

        assert_equal(album, album_hash)
      end
    end
  end
end
