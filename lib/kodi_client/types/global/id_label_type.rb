# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # id/label type
      class IdLabel
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :id, :label

        def initialize(id, label)
          @id = id
          @label = label
        end
      end
    end
  end
end
