{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.fish = {
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#tars --show-trace";

      # charges battery to 100% once (resets automatically)
      fullcharge = "sudo tlp fullcharge BAT0";
    };
  };
}
