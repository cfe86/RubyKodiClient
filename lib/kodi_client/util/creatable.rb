# frozen_string_literal: true

module KodiClient

  # creates a create and create_list method by hash
  module Creatable

    def attr_accessor(*args)
      attr_reader(*args)
      attr_writer(*args)
    end

    def attr_reader(*args)
      @kodi_fields = args.map { |it| it.to_s.gsub('_', '') }

      args.each do |it|
        inst_variable_name = "@#{it}".to_sym
        define_method it do
          instance_variable_get(inst_variable_name)
        end
      end
    end

    def attr_writer(*args)
      args.each do |it|
        inst_variable_name = "@#{it}".to_sym
        define_method "#{it}=" do |new_value|
          instance_variable_set(inst_variable_name, new_value)
        end
      end
    end

    def create_list(hash)
      hash.nil? ? [] : hash.map { |it| create(it) }
    end

    def create(hash)
      hash.nil? ? nil : new(*@kodi_fields.map { |it| hash[it] })
    end

    def self.hash_to_arr(hash, fields)
      fields.map { |it| hash[it].nil? ? nil : hash[it].to_s.gsub('_', '') }
    end

    def hash_to_arr(hash, fields)
      Creatable.hash_to_arr(hash, fields)
    end
  end
end
