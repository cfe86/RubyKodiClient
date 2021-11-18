# frozen_string_literal: true

module KodiClient

  # creates a create and create_list method by hash
  module Creatable

    def type_mapping
      {}
    end

    def create_list(hash)
      hash.nil? ? [] : hash.map { |it| create(it) }.reject(&:nil?)
    end

    def create(hash)
      return nil if hash.nil? || @kodi_fields.none? { |it| !hash[it.to_s.gsub('_', '')].nil? }

      mapping = type_mapping
      args = @kodi_fields.map do |it|
        field = it.to_s.gsub('_', '')
        Creatable.extract_field_from_hash(field, hash, mapping)
      end

      new(*args)
    end

    def self.hash_to_arr(hash, fields, mapping = {})
      return nil if hash.nil?

      fields.map do |it|
        field = it.to_s.gsub('_', '')
        extract_field_from_hash(field, hash, mapping)
      end
    end

    def hash_to_arr(hash, fields)
      Creatable.hash_to_arr(hash, fields, type_mapping)
    end

    def self.extract_field_from_hash(field, hash, mapping)
      return nil if hash[field].nil?

      map = mapping[field]
      return hash[field] if map.nil?

      return map.type.create_list(hash[field]) if map.is_list

      map.type.create(hash[field])
    end

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

    # mapping class with the type and if it is a list field or not
    class CreateMap

      attr_reader :type, :is_list

      def initialize(type, is_list = false)
        @type = type
        @is_list = is_list
      end
    end
  end
end
