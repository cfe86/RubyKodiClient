# frozen_string_literal: true

module KodiClient
  module Types
    module GUI
      # GUI.Property.Value https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Property.Value
      class PropertyValue
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :current_control, :current_window, :fullscreen, :skin, :stereoscopic_mode

        type_mapping ['currentcontrol', Global::IdLabel], ['currentwindow', Global::IdLabel],
                     ['skin', Global::IdName], ['stereoscopicmode', StereoscopyMode]

        def initialize(current_control, current_window, fullscreen, skin, stereoscopic_mode)
          @current_control = current_control
          @current_window = current_window
          @fullscreen = fullscreen
          @skin = skin
          @stereoscopic_mode = stereoscopic_mode
        end
      end
    end
  end
end
