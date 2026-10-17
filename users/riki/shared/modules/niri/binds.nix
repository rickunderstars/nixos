{ ... }:

{
  wayland.windowManager.niri.settings.binds = {
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

    ######## FOCUS ########
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

    ######## MOVE WINDOW/COLUMN ########
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

    ######## CONSUME/EXPAND WINDOW ########
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

    ######## MOVE WORKSPACE ########
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

    ## ROS ##
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
}
