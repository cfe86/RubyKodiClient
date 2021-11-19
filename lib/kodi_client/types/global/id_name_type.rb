# frozen_string_literal: true

module KodiClient
  module Types
    module Global
      # id/name type
      class IdName
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :id, :name

        def initialize(id, name)
          @id = id
          @name = name
        end
      end
    end
  end
end
