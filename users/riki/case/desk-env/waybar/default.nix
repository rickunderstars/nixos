{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.waybar = {
    settings = {
      mainBar = {
        cava = {
          bars = 32;
        };
      };
    };
  };
}
