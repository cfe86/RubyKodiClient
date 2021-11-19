# frozen_string_literal: true

module KodiClient
  module Types
    module Addons
      # represents addon details
      class AddonDetails
        include Extensions::Comparable
        include Items::ItemDetailsBase
        extend Extensions::Creatable

        attr_reader :addon_id, :author, :broken, :dependencies, :description, :disclaimer, :enabled, :extra_info,
                    :fan_art, :installed, :name, :path, :rating, :summary, :thumbnail, :type, :version

        fields_to_map %w[addon_id author broken dependencies description disclaimer enabled extra_info fan_art
                         installed name path rating summary thumbnail type version label]

        type_mapping ['dependencies', AddonDependency, true], ['extrainfo', AddonExtraInfo, true]

        def initialize(addon_id, author, broken, dependencies, description, disclaimer, enabled, extra_info,
                       fan_art, installed, name, path, rating, summary, thumbnail, type, version, label)
          @addon_id = addon_id
          @author = author
          @broken = broken
          @dependencies = dependencies
          @description = description
          @disclaimer = disclaimer
          @enabled = enabled
          @extra_info = extra_info
          @fan_art = fan_art
          @installed = installed
          @name = name
          @path = path
          @rating = rating
          @summary = summary
          @thumbnail = thumbnail
          @type = type
          @version = version
          item_details_base(label)
        end
      end
    end
  end
end
