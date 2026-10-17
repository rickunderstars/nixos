{ ... }:

{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      input = {
        disable-power-key-handling = { };
        focus-follows-mouse._props.max-scroll-amount = "33%";
        keyboard = {
          xkb = {
            layout = "us,it";
            variant = "intl,";
          };
          numlock = { };
        };
        touchpad = {
          tap = { };
          dwt = { };
          dwtp = { };
          drag = true;
          drag-lock = { };
          natural-scroll = { };
          click-method = "clickfinger";
          accel-speed = 0.0;
          accel-profile = "flat";
          scroll-method = "two-finger";
        };
        mouse = {
          accel-speed = 0.0;
          accel-profile = "flat";
        };
      };

      environment = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_QPA_PLATFORMTHEME = "gtk3";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
        MICRO_TRUECOLOR = "1";
        GSK_RENDERER = "gl";
        GTK_IM_MODULE = "simple";
      };

      layout = {
        gaps = 5;
        center-focused-column = "on-overflow";
        always-center-single-column = { };
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        preset-window-heights._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        default-column-width.proportion = 0.5;
        focus-ring.off = { };
        border = {
          width = 2;
          active-gradient._props = {
            from = "#89b4fa";
            to = "#cba6f7";
            angle = 330;
          };
          inactive-gradient._props = {
            from = "#181825";
            to = "#313244";
            angle = 330;
          };
          urgent-color = "#fab387";
        };
        background-color = "transparent";
        insert-hint.gradient._props = {
          from = "#74c7ec";
          to = "#cba6f7";
          angle = 60;
        };
        shadow = { };
        struts = {
          left = 10;
          right = 10;
        };
      };

      prefer-no-csd = { };

      blur = {
        passes = 2;
        offset = 4.0;
      };

      cursor = {
        hide-when-typing = { };
        hide-after-inactive-ms = 4096;
      };

      overview = {
        zoom = 0.45;
        backdrop-color = "#1e1e2e";
      };

      recent-windows = {
        highlight = {
          active-color = "#94e2d5";
          urgent-color = "#fab387";
          padding = 16;
          corner-radius = 8;
        };
        previews.max-scale = 0.4;
      };

      hotkey-overlay = {
        skip-at-startup = { };
        hide-not-bound = { };
      };

      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";

      animations.slowdown = 0.8;

      binds = {
        # binds cheatsheet
        "Mod+Shift+Slash".show-hotkey-overlay = { };

        # overview
        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = { };
        };
        "Mod+Z" = {
          _props.repeat = false;
          toggle-overview = { };
        };

        # close window
        "Mod+Q" = {
          _props.repeat = false;
          close-window = { };
        };

        # terminal (kitty)
        "Mod+Return".spawn = [ "kitty" ];
        "Mod+Shift+Return".spawn = [
          "kitty"
          "--class=float.kitty"
        ];

        # app launcher (tofi)
        "Mod+Space".spawn = [
          "fish"
          "-c"
          "pkill tofi || tofi-drun"
        ];

        # lock screen (hyprlock)
        "Mod+Shift+L".spawn = [
          "fish"
          "-c"
          "pidof hyprlock || hyprlock"
        ];

        # file manager (nautilus)
        "Mod+E".spawn = [
          "nautilus"
          "--new-window"
        ];

        # top (btop)
        "Ctrl+Shift+Escape".spawn = [
          "fish"
          "-c"
          "pidof btop && pkill btop || kitty --class=btop.kitty -e btop"
        ];

        # wallpaper
        "Mod+Shift+A".spawn = [
          "fish"
          "-c"
          "nawww"
        ];

        # audio switch
        "Mod+A" = {
          _props.allow-when-locked = true;
          spawn = [
            "fish"
            "-c"
            "auch"
          ];
        };

        # chameleos
        "Mod+Ctrl+C".spawn = [
          "fish"
          "-c"
          "chamel toggle"
        ];
        "Mod+Ctrl+X".spawn = [
          "fish"
          "-c"
          "chamel clear-and-deactivate"
        ];

        # toggle notifications
        "Mod+N".spawn = [
          "fish"
          "-c"
          "dunstify (toggle-msg-notif)"
        ];

        # media
        "Mod+P" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "play-pause"
          ];
        };
        "Mod+Ctrl+P" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--player"
            "shift"
          ];
        };
        "Mod+Shift+Minus" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "previous"
          ];
        };
        "Mod+Shift+Equal" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "next"
          ];
        };

        # volume
        "Mod+Minus" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "-2"
          ];
        };
        "Mod+Equal" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "+2"
          ];
        };

        # screenshot
        "Mod+S".screenshot-screen = { };
        "Print".screenshot-screen = { };
        "Mod+Shift+S".screenshot-window = { };
        "Shift+Print".screenshot-window = { };
        "Mod+Ctrl+S".screenshot = { };
        "Ctrl+Print".screenshot = { };

        # tty-clock
        "Mod+H".spawn = [
          "fish"
          "-c"
          "pidof tty-clock && pkill tty-clock || kitty --class=clock.kitty -e tty-clock tty-clock -c -s -f \"%a %e-%b-%Y\""
        ];

        # idle inhibitor
        "Mod+I" = {
          _props.allow-when-locked = true;
          spawn = [
            "fish"
            "-c"
            "idle-toggle"
          ];
        };

        # wiremix
        "Mod+V".spawn = [
          "fish"
          "-c"
          "pidof wiremix && pkill wiremix || kitty --class=wiremix.kitty -e wiremix"
        ];

        # hyprpicker
        "Mod+C".spawn = [
          "fish"
          "-c"
          "pidof hyprpicker && pkill hyprpicker || hyprpicker -a"
        ];

        # mute
        "Mod+M" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "mute-toggle"
          ];
        };

        # keyboard layout
        "Mod+Shift+Space" = {
          _props.allow-when-locked = true;
          spawn-sh = "niri msg action switch-layout next; layout=$(niri msg -j keyboard-layouts | jq -r '.names[.current_idx]'); dunstify -h string:x-dunst-stack-tag:kblayout \"Layout: $layout\"";
        };

        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "+2"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "-2"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--output-volume"
            "mute-toggle"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--input-volume"
            "mute-toggle"
          ];
        };
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "play-pause"
          ];
        };
        "XF86AudioPause" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "play-pause"
          ];
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "stop"
          ];
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "previous"
          ];
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--playerctl"
            "next"
          ];
        };
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--brightness"
            "raise"
          ];
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn = [
            "swayosd-client"
            "--brightness"
            "lower"
          ];
        };

        #//////// FOCUS ////////
        # within workspace
        "Mod+Up".focus-window-up = { };
        "Mod+Down".focus-window-down = { };
        "Mod+Left".focus-column-left = { };
        "Mod+Right".focus-column-right = { };
        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-column-left = { };
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-column-right = { };
        };

        # between workspaces
        "Mod+Comma".focus-workspace-up = { };
        "Mod+Period".focus-workspace-down = { };
        "Mod+MouseForward".focus-workspace-up = { };
        "Mod+MouseBack".focus-workspace-down = { };

        # between monitors (cycle)
        "Mod+Tab".spawn = [
          "fish"
          "-c"
          "focus-monitor-next"
        ];

        #//////// MOVE WINDOW/COLUMN ////////
        # within workspace
        "Mod+Ctrl+Up".move-window-up = { };
        "Mod+Ctrl+Down".move-window-down = { };
        "Mod+Ctrl+Left".move-column-left = { };
        "Mod+Ctrl+Right".move-column-right = { };
        "Mod+Ctrl+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-left = { };
        };
        "Mod+Ctrl+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-right = { };
        };

        # between workspaces
        "Mod+Ctrl+Comma".move-column-to-workspace-up = { };
        "Mod+Ctrl+Period".move-column-to-workspace-down = { };
        "Mod+Ctrl+MouseForward" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = { };
        };
        "Mod+Ctrl+MouseBack" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = { };
        };

        # between monitors
        "Mod+Ctrl+BracketLeft".move-column-to-monitor-left = { };
        "Mod+Ctrl+BracketRight".move-column-to-monitor-right = { };

        #//////// CONSUME/EXPAND WINDOW ////////
        # within workspace
        "Mod+Alt+Left".consume-or-expel-window-left = { };
        "Mod+Alt+Right".consume-or-expel-window-right = { };
        "Mod+Alt+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          consume-or-expel-window-left = { };
        };
        "Mod+Alt+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          consume-or-expel-window-right = { };
        };

        #//////// MOVE WORKSPACE ////////
        # between workspaces
        "Mod+Ctrl+Alt+Comma".move-workspace-up = { };
        "Mod+Ctrl+Alt+Period".move-workspace-down = { };
        "Mod+Ctrl+Alt+MouseForward".move-workspace-up = { };
        "Mod+Ctrl+Alt+MouseBack".move-workspace-down = { };

        # between monitors
        "Mod+Ctrl+Alt+BracketLeft".move-workspace-to-monitor-previous = { };
        "Mod+Ctrl+Alt+BracketRight".move-workspace-to-monitor-next = { };

        "Mod+T".toggle-window-floating = { };

        # width/height presets
        "Mod+Slash".switch-preset-window-width = { };
        "Mod+Backslash".switch-preset-window-height = { };
        "Mod+Shift+Backslash".reset-window-height = { };

        # maximize/fullscreen
        "Mod+F".maximize-column = { };
        "Mod+Shift+F".fullscreen-window = { };
        "Mod+Ctrl+Shift+F".toggle-windowed-fullscreen = { };

        # rotate monitor
        "Mod+R".spawn = [
          "fish"
          "-c"
          "rotate-toggle"
        ];

        # toggle binds inhibitors
        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = { };
        };

        # monitor off
        "Mod+Shift+P".power-off-monitors = { };

        #// ROS //
        "Mod+Shift+R".spawn = [
          "fish"
          "-c"
          "kitty -e fish -c 'cd ~/repos/violet && ros'"
        ];
        "Mod+Shift+M".spawn = [
          "fish"
          "-c"
          "kitty -e fish -c moveit"
        ];
      };

      _children = [
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
            { match._props.app-id = "org.gnome.Nautilus"; }
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
            { match._props.app-id = "kitty"; }
            { default-column-width.proportion = 0.5; }
            { opacity = 0.9; }
          ];
        }

        # float.kitty
        {
          window-rule._children = [
            { match._props.app-id = "float.kitty"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.3; }
            { default-window-height.proportion = 0.5; }
            { opacity = 0.9; }
          ];
        }

        # wifi.kitty
        {
          window-rule._children = [
            { match._props.app-id = "wifi.kitty"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.6; }
            { default-window-height.proportion = 0.6; }
            { opacity = 0.9; }
          ];
        }

        # bluetooth.kitty
        {
          window-rule._children = [
            { match._props.app-id = "bluetooth.kitty"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.6; }
            { default-window-height.proportion = 0.6; }
            { opacity = 0.9; }
          ];
        }

        # btop.kitty
        {
          window-rule._children = [
            { match._props.app-id = "btop.kitty"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.75; }
            { default-window-height.proportion = 0.75; }
            { opacity = 0.9; }
          ];
        }

        # wiremix.kitty
        {
          window-rule._children = [
            { match._props.app-id = "wiremix.kitty"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.6; }
            { default-window-height.proportion = 0.6; }
            { opacity = 0.9; }
          ];
        }

        # clock.kitty
        {
          window-rule._children = [
            { match._props.app-id = "clock.kitty"; }
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
            { match._props.app-id = "zen-twilight"; }
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
            { match._props.app-id = "blender"; }
            { default-column-width.proportion = 1.0; }
            { open-fullscreen = true; }
          ];
        }

        # ente-auth
        {
          window-rule._children = [
            { match._props.app-id = "io.ente.auth"; }
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
            { match._props.app-id = "whatsapp-electron"; }
            { match._props.app-id = "com.ayugram.desktop"; }
            { match._props.app-id = "signal"; }
            { match._props.app-id = "discord"; }
            { default-column-width.proportion = 0.66667; }
            { block-out-from = "screencast"; }
          ];
        }

        # localsend
        {
          window-rule._children = [
            { match._props.app-id = "localsend_app"; }
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
            { match._props.app-id = "bitwarden"; }
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
            { match._props.app-id = "imv"; }
            { open-floating = true; }
            { default-column-width.proportion = 0.8; }
            { default-window-height.proportion = 0.8; }
          ];
        }

        # steam
        {
          window-rule._children = [
            { match._props.app-id = "steam"; }
            { default-column-width.proportion = 0.66667; }
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "steam";
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
            { match._props.app-id = "anki"; }
            { opacity = 0.9; }
          ];
        }

        # logseq
        {
          window-rule._children = [
            { match._props.app-id = "Logseq"; }
            { default-column-width.proportion = 1.0; }
            { open-fullscreen = true; }
            { opacity = 0.97; }
          ];
        }

        # spotify and feishin
        {
          window-rule._children = [
            { match._props.app-id = "spotify"; }
            { match._props.app-id = "feishin"; }
            { default-column-width.proportion = 0.66667; }
            { opacity = 0.9; }
          ];
        }

        # codium
        {
          window-rule._children = [
            { match._props.app-id = "codium"; }
            { default-column-width.proportion = 1.0; }
            { opacity = 0.93; }
          ];
        }

        # plugdata
        {
          window-rule._children = [
            { match._props.app-id = "plugdata"; }
            { default-column-width.proportion = 1.0; }
            { open-maximized = true; }
            { opacity = 0.93; }
          ];
        }

        # protonmail
        {
          window-rule._children = [
            { match._props.app-id = "proton-mail"; }
            { default-column-width.proportion = 1.0; }
            { opacity = 0.93; }
          ];
        }

        # stremio
        {
          window-rule._children = [
            { match._props.app-id = "com.stremio.Stremio"; }
            { default-column-width.proportion = 1.0; }
            { open-fullscreen = true; }
          ];
        }

        # unity, godot, aseprite, fmod
        {
          window-rule._children = [
            { match._props.app-id = "unityhub"; }
            { match._props.app-id = "Unity"; }
            { match._props.app-id = "Godot"; }
            { match._props.app-id = "Aseprite"; }
            { match._props.app-id = "fmodstudio"; }
            { default-column-width.proportion = 1.0; }
          ];
        }

        {
          spawn-at-startup._args = [
            "nawww"
            "--init"
          ];
        }
        { spawn-at-startup._args = [ "hyprlock" ]; }
        { spawn-at-startup._args = [ "hypridle" ]; }
        {
          spawn-at-startup._args = [
            "bluetoothctl"
            "power"
            "off"
          ];
        }
        {
          spawn-at-startup._args = [
            "fish"
            "-c"
            "chameleos -w 5 -c '#d20f39'"
          ];
        }
        {
          spawn-at-startup._args = [
            "fish"
            "-c"
            "toggle-msg-notif"
          ];
        }

        {
          window-rule._children = [
            { match._props.app-id = "rqt"; }
            { open-floating = true; }
          ];
        }
        {
          window-rule._children = [
            { match._props.app-id = "rviz2"; }
            { default-column-width.proportion = 1.0; }
          ];
        }
      ];
    };
  };
}
