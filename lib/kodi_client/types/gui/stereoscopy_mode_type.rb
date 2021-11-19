# frozen_string_literal: true

module KodiClient
  module Types
    module GUI
      # GUI.Stereoscopy.Mode https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Stereoscopy.Mode
      class StereoscopyMode
        include Extensions::Comparable
        include Extensions::Iterable
        extend Extensions::Creatable

        attr_reader :label, :mode

        OFF = 'off'
        SPLIT_VERTICAL = 'split_vertical'
        SPLIT_HORIZONTAL = 'split_horizontal'
        ROW_INTERLEAVED = 'row_interleaved'
        HARDWARE_BASED = 'hardware_based'
        ANAGLYPH_CYAN_RED = 'anaglyph_cyan_red'
        ANAGLYPH_GREEN_MAGENTA = 'anaglyph_green_magenta'
        ANAGLYPH_YELLOW_BLUE = 'anaglyph_yellow_blue'
        MONOSCOPIC = 'monoscopic'

        def initialize(label, mode)
          @label = label
          @mode = mode
        end
      end
    end
  end
end
