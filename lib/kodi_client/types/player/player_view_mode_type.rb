# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # return value for Player.GetViewMode
      class PlayerViewMode
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :nonlinear_stretch, :pixel_ratio, :vertical_shift, :view_mode, :zoom

        def initialize(nonlinear_stretch, pixel_ratio, vertical_shift, view_mode, zoom)
          @nonlinear_stretch = nonlinear_stretch
          @pixel_ratio = pixel_ratio
          @vertical_shift = vertical_shift
          @view_mode = view_mode
          @zoom = zoom
        end
      end
    end
  end
end
