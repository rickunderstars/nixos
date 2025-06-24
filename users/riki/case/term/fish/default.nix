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
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#case --show-trace";
    };
  };
}
