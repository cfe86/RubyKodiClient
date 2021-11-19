# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # player item
      class Player
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :player_id, :player_type, :type, :name, :plays_audio, :plays_video

        def initialize(player_id, player_type, type, name, plays_audio, plays_video)
          @player_id = player_id
          @player_type = player_type
          @type = type
          @name = name
          @plays_audio = plays_audio
          @plays_video = plays_video
        end
      end
    end
  end
end
