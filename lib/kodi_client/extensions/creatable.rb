# frozen_string_literal: true

module KodiClient
  module Extensions
    # creates a create and create_list method by hash
    module Creatable

      # sets the fields to fetch from the given hash for the #create method. This is optional and only to use, if
      # more fields should be fetched than are provided using attr_reader
      # @param [Array<String>] fields the fields given as a string array
      def fields_to_map(fields)
        @fields_to_map = fields
      end

      # defines mappings in case an attribute in the hash is not primitive and requires further processing. The argument
      # is an Array of Arrays. Each array contains ['field_name', [type_to_map_to], [opt if field is a list]]
      # @param args [Array<Array>] mappings. Example mapping ['art', Media::ArtWork, true], in this case
      # Media::ArtWork.create_list will be called
      def type_mapping(*args)
        return if args.nil?

        @type_mapping = {}
        args.map { |it| @type_mapping[it[0]] = Creatable.arr_to_mapping(it) }
      end

      def self.arr_to_mapping(arr)
        Creatable::CreateMap.new(arr[1], arr[2].nil? ? false : arr[2])
      end

      # expects the given hash is a list of hashes and calls #create on each element
      # @param [Array<Hash>] hash given list of hashes
      # @return [Array] empty if hash is nil, otherwise array containing the elements
      def create_list(hash)
        hash.nil? ? [] : hash.map { |it| create(it) }.reject(&:nil?)
      end

      # creates a Creatable using the provided hash and the attr_reader fields, or if given #fields_to_map instead
      # The parameters will be passed to initialize the object in the same order as they are passed to attr_reader
      # or #fields_to_map
      # @param hash [Hash, nil] the given hash to convert to an object
      # @return the created object, or nil if the given hash is nil
      def create(hash)
        return nil if hash.nil?

        if @fields_to_map.nil? || @fields_to_map.empty?
          fields = @kodi_fields
          return nil if @kodi_fields.none? { |it| !hash[it.to_s.gsub('_', '')].nil? }
        else
          fields = @fields_to_map
        end

        mapping = @type_mapping.nil? ? {} : @type_mapping
        args = fields.map do |it|
          field = it.to_s.gsub('_', '')
          Creatable.extract_field_from_hash(field, hash, mapping)
        end

        new(*args)
      end

      # takes a hash and a list of strings and an optional mapping and creates a new array with the created objects
      # of the hash and fields. If no mapping is provided, the value of this field is returned, otherwise the mapping is
      # used
      # @param hash [Hash] the given hash
      # @param fields [Array<String>] the fields to extract
      # @param mapping [Hash<String>, Array<Array<String>>] optional mapping if a field contains a complex type
      # @return [Array] an array containing the values of hash[field] in the given field order
      def self.hash_to_arr(hash, fields, mapping = {})
        return nil if hash.nil?

        mapping = mapping.map { |it| arr_to_mapping(it) } unless mapping.is_a?(Hash)

        fields.map do |it|
          field = it.to_s.gsub('_', '')
          extract_field_from_hash(field, hash, mapping)
        end
      end

      # extracts the given field from the given hash and optionally applies mapping if given
      # @param field [String] the field name
      # @param hash [Hash, nil] the hash where to extract the field from
      # @param mapping [Hash<String, CreateMap>] optional mapping for complex types
      # @return the extracted object or nil, if the hash is empty, or [] if the expected value was a list and was nil
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
end
