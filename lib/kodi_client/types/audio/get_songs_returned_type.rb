# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # return type for AudioLibrary.GetSongs
      class GetSongsReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :songs, :limits

        type_mapping ['songs', Audio::AudioDetailsSong, true], ['limits', List::ListLimitsReturned]

        def initialize(songs, limits)
          @songs = songs
          @limits = limits
        end
      end
    end
  end
end



