{ ... }:

{
  wayland.windowManager.niri.settings._children = [

    # layer rules
    {
      layer-rule._children = [
        { match._props.namespace = "awww-daemon"; }
        { place-within-backdrop = true; }
      ];
    }
    {
      layer-rule._children = [
        { match._props.namespace = "launcher"; }
        {
          background-effect = {
            blur = true;
            xray = false;
          };
        }
      ];
    }
    {
      layer-rule._children = [
        { match._props.namespace = "notifications"; }
        {
          background-effect = {
            blur = false;
            xray = false;
          };
        }
        { opacity = 0.97; }
        { block-out-from = "screencast"; }
      ];
    }

    # global window rules
    {
      window-rule._children = [
        { geometry-corner-radius = 8; }
        { clip-to-geometry = true; }
        { draw-border-with-background = false; }
        {
          background-effect = {
            blur = true;
            xray = true;
          };
        }
        { open-maximized-to-edges = false; }
      ];
    }

    # floating windows border
    {
      window-rule._children = [
        { match._props.is-floating = true; }
        {
          border.active-gradient._props = {
            from = "#74c7ec";
            to = "#f5c2e7";
            angle = 330;
          };
        }
      ];
    }

    # casted windows
    {
      window-rule._children = [
        { match._props.is-window-cast-target = true; }
        {
          border = {
            active-gradient._props = {
              from = "#40a02b";
              to = "#40a02b";
              angle = 330;
            };
            inactive-gradient._props = {
              from = "#40a02b";
              to = "#40a02b";
              angle = 330;
            };
          };
        }
        {
          shadow = {
            on = { };
            color = "#40a02b70";
          };
        }
      ];
    }

    # nautilus
    {
      window-rule._children = [
        { match._props.app-id = "(?i)nautilus"; }
        { open-floating = true; }
        {
          default-floating-position._props = {
            x = 128;
            y = 128;
            relative-to = "top-left";
          };
        }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.9; }
      ];
    }

    # kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)kitty"; }
        { default-column-width.proportion = 0.5; }
        { opacity = 0.9; }
      ];
    }

    # float.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)float.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.3; }
        { default-window-height.proportion = 0.5; }
        { opacity = 0.9; }
      ];
    }

    # wifi.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)wifi.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.9; }
      ];
    }

    # bluetooth.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)bluetooth.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.9; }
      ];
    }

    # btop.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)btop.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.75; }
        { default-window-height.proportion = 0.75; }
        { opacity = 0.9; }
      ];
    }

    # wiremix.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)wiremix.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.9; }
      ];
    }

    # clock.kitty
    {
      window-rule._children = [
        { match._props.app-id = "(?i)clock.kitty"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.5; }
        { default-window-height.proportion = 0.5; }
        { opacity = 0.9; }
      ];
    }

    # xdg-desktop-portal
    {
      window-rule._children = [
        { match._props.app-id = "(?i)^xdg-desktop-portal"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
      ];
    }

    # select dialogs
    {
      window-rule._children = [
        { match._props.title = "(?i)^select"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
      ];
    }

    # zen
    {
      window-rule._children = [
        { match._props.app-id = "(?i)zen-twilight"; }
        { default-column-width.proportion = 1.0; }
      ];
    }

    # zen dialogs
    {
      window-rule._children = [
        { match._props.title = "^(Library|Extension:.*)"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.7; }
        { default-window-height.proportion = 0.7; }
      ];
    }

    # blender
    {
      window-rule._children = [
        { match._props.app-id = "(?i)blender"; }
        { default-column-width.proportion = 1.0; }
        { open-fullscreen = true; }
      ];
    }

    # ente-auth
    {
      window-rule._children = [
        { match._props.app-id = "(?i)io.ente.auth"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.6; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.9; }
        { block-out-from = "screencast"; }
      ];
    }

    # messaging apps
    {
      window-rule._children = [
        { match._props.app-id = "(?i)whatsapp-electron"; }
        { match._props.app-id = "(?i)com.ayugram.desktop"; }
        { match._props.app-id = "(?i)signal"; }
        { match._props.app-id = "(?i)discord"; }
        { default-column-width.proportion = 0.66667; }
        { block-out-from = "screencast"; }
      ];
    }

    # localsend
    {
      window-rule._children = [
        { match._props.app-id = "(?i)localsend_app"; }
        { open-floating = true; }
        {
          default-floating-position._props = {
            x = 100;
            y = 100;
            relative-to = "top-right";
          };
        }
        { default-column-width.proportion = 0.5; }
        { default-window-height.proportion = 0.6; }
        { opacity = 0.93; }
      ];
    }

    # bitwarden
    {
      window-rule._children = [
        { match._props.app-id = "(?i)bitwarden"; }
        { open-floating = true; }
        {
          default-floating-position._props = {
            x = 100;
            y = 100;
            relative-to = "bottom-left";
          };
        }
        { default-column-width.proportion = 0.4; }
        { default-window-height.proportion = 0.4; }
        { opacity = 0.93; }
      ];
    }

    # imv
    {
      window-rule._children = [
        { match._props.app-id = "(?i)imv"; }
        { open-floating = true; }
        { default-column-width.proportion = 0.8; }
        { default-window-height.proportion = 0.8; }
      ];
    }

    # steam
    {
      window-rule._children = [
        { match._props.app-id = "(?i)steam"; }
        { default-column-width.proportion = 0.66667; }
      ];
    }
    {
      window-rule._children = [
        {
          match._props = {
            app-id = "(?i)steam";
            title = "^notificationtoasts_\\d+_desktop$";
          };
        }
        {
          default-floating-position._props = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
        }
      ];
    }

    # anki
    {
      window-rule._children = [
        { match._props.app-id = "(?i)anki"; }
        { opacity = 0.9; }
      ];
    }

    # logseq
    {
      window-rule._children = [
        { match._props.app-id = "(?i)logseq"; }
        { default-column-width.proportion = 1.0; }
        { open-fullscreen = true; }
        { opacity = 0.97; }
      ];
    }

    # spotify and feishin
    {
      window-rule._children = [
        { match._props.app-id = "(?i)spotify"; }
        { match._props.app-id = "(?i)feishin"; }
        { default-column-width.proportion = 0.66667; }
        { opacity = 0.9; }
      ];
    }

    # codium
    {
      window-rule._children = [
        { match._props.app-id = "(?i)codium"; }
        { default-column-width.proportion = 1.0; }
        { opacity = 0.93; }
      ];
    }

    # plugdata
    {
      window-rule._children = [
        { match._props.app-id = "(?i)plugdata"; }
        { default-column-width.proportion = 1.0; }
        { open-maximized = true; }
        { opacity = 0.93; }
      ];
    }

    # protonmail
    {
      window-rule._children = [
        { match._props.app-id = "(?i)proton-mail"; }
        { default-column-width.proportion = 1.0; }
        { opacity = 0.93; }
      ];
    }

    # stremio
    {
      window-rule._children = [
        { match._props.app-id = "(?i)stremio"; }
        { default-column-width.proportion = 1.0; }
        { open-fullscreen = true; }
      ];
    }

    # unity, godot, aseprite, fmod
    {
      window-rule._children = [
        { match._props.app-id = "(?i)unityhub"; }
        { match._props.app-id = "(?i)unity"; }
        { match._props.app-id = "(?i)godot"; }
        { match._props.app-id = "(?i)aseprite"; }
        { match._props.app-id = "(?i)fmodstudio"; }
        { default-column-width.proportion = 1.0; }
      ];
    }

    {
      window-rule._children = [
        { match._props.app-id = "(?i)rqt"; }
        { open-floating = true; }
      ];
    }
    {
      window-rule._children = [
        { match._props.app-id = "(?i)rviz2"; }
        { default-column-width.proportion = 1.0; }
      ];
    }
  ];
}
