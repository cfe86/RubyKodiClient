# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'

module KodiClient
  module Types
    module Application

      # Application.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#Application.Property.Name
      module PropertyName
        extend Iterable

        VOLUME = 'volume'
        MUTED = 'muted'
        NAME = 'name'
        VERSION = 'version'
        SORT_TOKENS = 'sorttokens'
        LANGUAGE = 'language'
      end

      # Application.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#Application.Property.Value
      class PropertyValue
        include Comparable
        extend Creatable

        attr_reader :name, :version, :muted, :volume

        def self.create(hash)
          return null if hash.nil?

          version = Version.create(hash['version'])
          new(hash['name'], version, hash['muted'], hash['volume'])
        end

        def initialize(name, version, muted, volume)
          @name = name
          @version = version
          @muted = muted
          @volume = volume
        end
      end

      # represent application properties version
      class Version
        include Comparable
        extend Creatable

        attr_reader :major, :minor, :revision, :tag

        def initialize(major, minor, revision, tag)
          @major = major
          @minor = minor
          @revision = revision
          @tag = tag
        end
      end
    end
  end
end
