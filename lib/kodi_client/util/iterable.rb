# frozen_string_literal: true

module KodiClient

  # offers iterable methods
  module Iterable
    def all_properties
      constants.map { |it| const_get(it) }.sort!
    end
  end
end
