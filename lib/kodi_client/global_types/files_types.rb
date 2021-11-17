# frozen_string_literal: true

require 'kodi_client/util/comparable'
require 'kodi_client/util/iterable'
require 'kodi_client/util/creatable'
require 'kodi_client/global_types/list_types'

module KodiClient
  module Types
    module Files

      # Files.Media https://kodi.wiki/view/JSON-RPC_API/v12#Files.Media
      module Media
        extend Iterable

        VIDEO = 'video'
        MUSIC = 'music'
        PICTURES = 'pictures'
        FILES = 'files'
        PROGRAMS = 'programs'
      end

      # return value for GetDirectory
      class GetDirectoryReturned
        include Comparable
        extend Creatable

        attr_reader :files, :limits

        def self.create(hash)
          return nil if hash.nil?

          files = Types::List::ListItemFile.create_list(hash['files'])
          limits = Types::List::ListLimitsReturned.create(hash['limits'])

          new(files, limits)
        end

        def initialize(files, limits)
          @files = files
          @limits = limits
        end
      end

      # return value for GetSources
      class GetSourcesReturned
        include Comparable
        extend Creatable

        attr_reader :sources, :limits

        def self.create(hash)
          return nil if hash.nil?

          sources = Types::List::FileLabel.create_list(hash['sources'])
          limits = Types::List::ListLimitsReturned.create(hash['limits'])

          new(sources, limits)
        end

        def initialize(sources, limits)
          @sources = sources
          @limits = limits
        end
      end

      # return value for GetPrepareDownload
      class PrepareDownloadReturned
        include Comparable
        extend Creatable

        attr_reader :details, :mode, :protocol

        def initialize(details, mode, protocol)
          @details = details
          @mode = mode
          @protocol = protocol
        end
      end
    end
  end
end
