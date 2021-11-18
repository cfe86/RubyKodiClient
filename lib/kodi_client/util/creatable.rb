# frozen_string_literal: true

module KodiClient

  # creates a create and create_list method by hash
  module Creatable

    def fields_to_map(fields)
      @fields_to_map = fields
    end

    def type_mapping(*args)
      return if args.nil?

      @type_mapping = {}
      args.map { |it| @type_mapping[it[0]] = Creatable::CreateMap.new(it[1], it[2].nil? ? false : it[2]) }
    end

    def lazy_type_mapping
      {}
    end

    def create_list(hash)
      hash.nil? ? [] : hash.map { |it| create(it) }.reject(&:nil?)
    end

    def create(hash)
      return nil if hash.nil?

      if @fields_to_map.nil? || @fields_to_map.empty?
        fields = @kodi_fields
        return nil if @kodi_fields.none? { |it| !hash[it.to_s.gsub('_', '')].nil? }
      else
        fields = @fields_to_map
      end

      mapping = @type_mapping.nil? ? lazy_type_mapping : @type_mapping
      args = fields.map do |it|
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
      Creatable.hash_to_arr(hash, fields, @type_mapping.nil? ? {} : @type_mapping)
    end

    def self.extract_field_from_hash(field, hash, mapping)
      map = mapping[field]
      return nil if hash[field].nil? && map.nil?

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
