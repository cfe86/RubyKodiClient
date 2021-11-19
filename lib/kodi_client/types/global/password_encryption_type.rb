# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # available Password Encryptions
      module PasswordEncryption
        extend Extensions::Iterable

        NONE = 'none'
        MD5 = 'md5'
      end
    end
  end
end

