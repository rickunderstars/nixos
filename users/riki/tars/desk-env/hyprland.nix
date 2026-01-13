{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1, 2880x1800@120, auto, 2"
      ];

      exec-once = [
      ];

      env = [
        "GDK_SCALE,2"
        #"QT_SCALE_FACTOR,2"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      ];

      bind = [

        ### switch workspace (counting empty ones, creates new workspace if does not exist)
        "CTRL $mod, period, workspace, +1"
        "CTRL $mod, comma, workspace, -1"

        ### move to workspaces (counting empty ones, creates new workspace if does not exist)
        "CTRL SHIFT $mod, period, movetoworkspace, +1"
        "CTRL SHIFT $mod, comma, movetoworkspace, -1"

      ];

      bindl = [
        ### on lid close: mute, pause, suspend
        ", switch:on:Lid Switch, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 1; playerctl pause; systemctl suspend"
      ];

      windowrule = [
        # calendar
        "match:class gsimplecal, move (monitor_w-window_w-(5+2)) (5*2+34)"
      ];

      # forces xwayland not to scale x11 apps
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
