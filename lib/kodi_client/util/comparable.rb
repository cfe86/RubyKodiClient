# frozen_string_literal: true

module KodiClient

  # offers compare methods
  module Comparable

    def compare(obj1, obj2)
      is_same = true
      obj1.instance_variables.each do |it|
        is_same = false if obj1.instance_variable_get(it) != obj2.instance_variable_get(it)
      end

      is_same
    end
  end
end
