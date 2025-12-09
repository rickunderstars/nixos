{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.fish = {

    functions = {
      mirror = "wl-mirror eDP-1 & sleep 0.5 && hyprctl dispatch fullscreen 0 && hyprctl dispatch movewindow mon:+1 && hyprctl dispatch focusmonitor -1";
    };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#tars --show-trace";

      # charges battery to 100% once (resets automatically)
      fullcharge = "sudo tlp fullcharge BAT0";
    };
  };
}
