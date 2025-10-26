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
        ", preferred, auto, 1, mirror, eDP-1"
      ];

      exec-once = [
      ];

      bind = [

        ### switch workspace (between active ones)
        "$mod, period, workspace, m+1"
        "$mod, comma, workspace, m-1"

        ### switch workspace (counting empty ones, creates new workspace if does not exist)
        "CTRL $mod, period, workspace, +1"
        "CTRL $mod, comma, workspace, -1"

        ### move to workspaces (counting empty ones, creates new workspace if does not exist)
        "CTRL SHIFT $mod, period, movetoworkspace, +1"
        "CTRL SHIFT $mod, comma, movetoworkspace, -1"

        ### move to workspaces (counting empty ones, creates new workspace if does not exist)
        "CTRL SHIFT $mod, period, movetoworkspace, +1"
        "CTRL SHIFT $mod, comma, movetoworkspace, -1"

      ];

      # forces xwayland not to scale x11 apps
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
