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

      # forces xwayland not to scale x11 apps
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
