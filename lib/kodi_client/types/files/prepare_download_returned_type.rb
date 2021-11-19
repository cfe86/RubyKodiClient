# frozen_string_literal: true

module KodiClient
  module Types
    module Files
      # return value for GetPrepareDownload
      class PrepareDownloadReturned
        include Extensions::Comparable
        extend Extensions::Creatable

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
