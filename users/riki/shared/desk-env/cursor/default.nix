{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.pointerCursor = {
    gtk.enable = true;
    enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
  };
}
