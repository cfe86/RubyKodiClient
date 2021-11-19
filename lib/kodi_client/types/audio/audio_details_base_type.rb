# frozen_string_literal: true

module KodiClient
  module Types
    module Audio
      # Audio.Details.Base https://kodi.wiki/view/JSON-RPC_API/v12#Audio.Details.Base
      module AudioDetailsBase
        include Media::MediaDetailsBase

        attr_reader :art, :date_added, :genre

        def audio_details_base_mappings
          mappings = { 'art' => Extensions::Creatable::CreateMap.new(Types::Media::MediaArtwork) }
          mappings.merge(media_details_base_mappings)
        end

        def audio_details_base_by_hash(hash)
          audio_details_base(*Extensions::Creatable.hash_to_arr(hash, %w[art date_added genre fan_art thumbnail label]),
                             audio_details_base_mappings)
        end

        def audio_details_base(art, date_added, genre, fan_art, thumbnail, label)
          @art = art
          @date_added = date_added
          @genre = genre
          media_details_base(fan_art, thumbnail, label)
        end
      end
    end
  end
end
