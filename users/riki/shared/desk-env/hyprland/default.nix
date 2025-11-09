{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    systemd.enable = false;
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      exec-once = [
        "hyprlock"
        "hypridle"
        "hyprpaper"
        "waybar &"
        "systemctl --user start hyprpolkitagent"
        "bluetoothctl power off"
      ];

      workspace = [
        "special:magic, gapsout:40, gapsin:20"
      ];

      windowrulev2 = [

        # games
        "idleinhibit always, class:gamescope" # always idle inhibit when gamescope active"

        # steam
        "float, class:^(steam)$, title:negative:^(Steam)$"
        "idleinhibit always, class:steam_app_[0-9]+" # always idle inhibit when playing a steam game"

        # itch
        "idleinhibit always, class:itch"

        # heroic
        "idleinhibit always, class:heroic"

        # network
        "float, class:ghostty.network"
        "size 60% 60%, class:ghostty.network"

        # bluetooth
        "float, class:ghostty.bluetooth"
        "size 60% 60%, class:ghostty.bluetooth"

        # ente-auth
        "float, class:io.ente.auth"
        "size 60% 60%, class:io.ente.auth"

        # pcloud
        "float, class:pcloud"
        "size 60% 60%, class:pcloud"

        # localsend
        "float, class:localsend_app"
        "size 40% 50%, class:localsend_app"
      ];

      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
      ];

      "$mod" = "SUPER";

      bind = [

        ### lock
        "$mod SHIFT, l, exec, pidof hyprlock || hyprlock"

        ### ghostty
        "$mod, return, exec, ghostty"

        ### close/kill window
        "$mod, q, killactive, "
        "$mod SHIFT, q, forcekillactive, "

        ### network
        "$mod, w, exec, ghostty --class=ghostty.network -e nmtui-connect"

        ### bluetooth
        "$mod, b, exec, ghostty --class=ghostty.bluetooth -e bluetuith"

        ### audio switch
        "$mod, a, exec, fish -c auch"

        ### file explorer
        "$mod, e, exec, nautilus --new-window"

        ### switch keyboard layout
        "$mod, space, exec, hyprctl switchxkblayout all next; dunstify 'Switched keyboard layout'"

        ### media control
        "$mod, p, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        "$mod, bracketright, exec, playerctl next"
        ", XF86AudioNext, exec, playerctl next"
        "$mod, bracketleft, exec, playerctl previous"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"

        ### screenshots
        "$mod, s, exec, fish -c 'grimblast -n -f copysave area'"
        ", print, exec, fish -c 'grimblast -n -f copysave area'"
        "SHIFT, print, exec, fish -c 'grimblast -n copysave screen'"
        "$mod SHIFT, s, exec, fish -c 'grimblast -n copysave screen'"

        # audio mute toggle
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mod, m, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # mic mute toggle
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        ### fullscreen and floating
        "$mod SHIFT, f, fullscreen, 0"
        "$mod, f, fullscreen, 1"
        "$mod, t, togglefloating, "

        ### move focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        ### move window
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        ### resize window
        "$mod CTRL, h, resizeactive, -20 0"
        "$mod CTRL, l, resizeactive, 20 0"
        "$mod CTRL, k, resizeactive, 0 -20"
        "$mod CTRL, j, resizeactive, 0 20"
        "$mod CTRL, left, resizeactive, -20 0"
        "$mod CTRL, right, resizeactive, 20 0"
        "$mod CTRL, up, resizeactive, 0 -20"
        "$mod CTRL, down, resizeactive, 0 20"

        ### move between workspaces of same monitor
        "$mod, period, workspace, m+1"
        "$mod, comma, workspace, m-1"
        "$mod SHIFT, mouse_down, workspace, m+1"
        "$mod SHIFT, mouse_up, workspace, m-1"

        ### move to monitor
        "$mod SHIFT, comma, movewindow, mon:l"
        "$mod SHIFT, period, movewindow, mon:r"

        ### focus monitor (cycle)
        "$mod, tab, focusmonitor, +1"

        ### special workspace
        "$mod, equal, togglespecialworkspace, magic"
      ];

      bindel = [
        # volume control
        ", XF86AudioLowerVolume, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 2%- && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 2%+ && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"
        "$mod SHIFT, bracketleft, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 2%- && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"
        "$mod SHIFT, bracketright, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 2%+ && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"

        # screen brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:272, togglefloating"
        "$mod, mouse:273, resizewindow"

      ];

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 3.5, easeOutExpo, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        float_gaps = 8;
        resize_on_border = true;
        extend_border_grab_area = 30;
        border_size = 2;
        allow_tearing = true;
        "col.active_border" = "rgba(89b4faff) rgba(cba6f7ff) 310deg"; # blue -> mavue
        "col.inactive_border" = "rgba(181825ff) rgba(313244ff) 310deg";
      };

      decoration = {
        rounding = 10;
        blur = {
          xray = true;
        };
      };

      input = {
        kb_layout = "us,it";
        kb_variant = "intl,";
        follow_mouse = 1;
        scroll_method = "2fg";
        accel_profile = "flat";
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          drag_lock = true;
          clickfinger_behavior = true;
        };
      };

      gesture = [
        "3, horizontal, workspace"
        "3, vertical, fullscreen, maximize"
        "4, left, dispatcher, movetoworkspace, -1"
        "4, right, dispatcher, movetoworkspace, +1"
      ];

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        new_window_takes_over_fullscreen = 1;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      cursor = {
        inactive_timeout = 5;
        persistent_warps = true;
        warp_on_change_workspace = 1;
        warp_on_toggle_special = 1;
        hide_on_key_press = true;
      };

      ecosystem = {
        no_donation_nag = true;
      };
    };
  };

}
