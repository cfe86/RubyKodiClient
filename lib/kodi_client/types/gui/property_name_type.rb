# frozen_string_literal: true

module KodiClient
  module Types
    module GUI
      # GUI.Property.Name https://kodi.wiki/view/JSON-RPC_API/v12#GUI.Property.Name
      module PropertyName
        extend Extensions::Iterable

        CURRENT_CONTROL = 'currentcontrol'
        CURRENT_WINDOW = 'currentwindow'
        FULLSCREEN = 'fullscreen'
        SKIN = 'skin'
        STEREOSCOPIC_MODE = 'stereoscopicmode'
      end
    end
  end
end
