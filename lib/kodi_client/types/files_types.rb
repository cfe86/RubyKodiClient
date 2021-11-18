# frozen_string_literal: true

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

        type_mapping ['files', List::ListItemFile, true], ['limits', List::ListLimitsReturned]

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

        type_mapping ['sources', List::FileLabel, true], ['limits', List::ListLimitsReturned]

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
