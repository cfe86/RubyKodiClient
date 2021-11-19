# frozen_string_literal: true

module KodiClient
  module Types
    module Profiles
      # Profiles.Password https://kodi.wiki/view/JSON-RPC_API/v12#Profiles.Password
      class ProfilePassword
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :value, :encryption

        def initialize(value, encryption = Types::Global::PasswordEncryption::MD5)
          @value = value
          @encryption = encryption
        end
      end
    end
  end
end
