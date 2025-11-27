{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.waybar = {
    style = ../../../assets/waybar/tars-style.css;
    settings = {
      mainBar = {
        cava = {
          bars = 12;
        };
      };
    };
  };
}
