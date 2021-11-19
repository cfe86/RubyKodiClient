# frozen_string_literal: true

module KodiClient
  module Types
    module Files
      # File/Label tuple
      class FileLabel
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :file, :label

        def initialize(file, label)
          @file = file
          @label = label
        end
      end
    end
  end
end
