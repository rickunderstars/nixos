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
      ## third is top left corner
      monitor = [
        "DP-3, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 1920x1080@75, -1920x0, 1"
        ", preferred, auto, 1"
      ];

      windowrulev2 = [
      ];

      workspace = [
        "1, monitor:DP-3"
        "2, monitor:HDMI-A-1"
      ];

      bind = [

        ### switch workspace (counting empty ones, creates new workspace if does not exist)
        "CTRL $mod, period, workspace, +2"
        "CTRL $mod, comma, workspace, -2"

        ### move to workspaces (counting empty ones, creates new workspace if does not exist)
        "CTRL SHIFT $mod, period, movetoworkspace, +2"
        "CTRL SHIFT $mod, comma, movetoworkspace, -2"

      ];

      cursor = {
        default_monitor = "DP-3";
      };

    };
  };
}
