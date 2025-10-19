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
    };
  };
}
