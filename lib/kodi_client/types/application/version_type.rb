# frozen_string_literal: true

module KodiClient
  module Types
    module Application
      # represent application properties version
      class Version
        include Extensions::Comparable
        extend Extensions::Creatable

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
