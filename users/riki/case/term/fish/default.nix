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
      nrs = "rm /home/riki/.config/mimeapps.list.backup; sudo nixos-rebuild switch --flake ~/nixos-config#case --show-trace";
    };
  };
}
