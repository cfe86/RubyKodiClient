# frozen_string_literal: true

require 'kodi_client/util/iterable'

module KodiClient
  module Types
    module PVR

      # PVR.Channel.Type https://kodi.wiki/view/JSON-RPC_API/v12#PVR.Channel.Type
      module ChannelType
        extend Iterable
        
        TV = 'TV'
        RADIO = 'Radio'
      end
    end
  end
end

