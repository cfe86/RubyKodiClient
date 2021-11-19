# frozen_string_literal: true

module KodiClient
  module Extensions
    # offers iterable methods
    module Iterable

      # @return [Array<String>] returns all constant values if sorted order
      def all_properties
        constants.map { |it| const_get(it) }.sort!
      end
    end
  end
end
