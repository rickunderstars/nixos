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
        "DP-3, preferred, auto, 1"
        "HDMI-1, preferred, auto-left, 1"
        ", preferred, auto, 1"
      ];
    };
  };
}
