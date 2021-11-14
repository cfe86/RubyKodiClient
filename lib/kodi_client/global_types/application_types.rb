# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'

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

        attr_reader :name, :version, :muted, :volume

        def initialize(hash)
          @name = hash['name']
          @version = hash['version'].nil? ? nil : Version.new(hash['version'])
          @muted = hash['muted']
          @volume = hash['volume']
        end

        def ==(other)
          compare(self, other)
        end
      end

      # represent application properties version
      class Version
        include Comparable
        attr_reader :major, :minor, :revision, :tag

        def initialize(hash)
          @major = hash['major']
          @minor = hash['minor']
          @revision = hash['revision']
          @tag = hash['tag']
        end

        def ==(other)
          compare(self, other)
        end
      end
    end
  end
end
