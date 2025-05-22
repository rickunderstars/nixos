{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 64;
  };
}
