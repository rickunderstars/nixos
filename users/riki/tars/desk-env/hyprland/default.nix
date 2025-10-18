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
      monitor = " , preferred, auto, 2";

      exec-once = [
      ];

      # forces xwayland not to scale x11 apps
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
