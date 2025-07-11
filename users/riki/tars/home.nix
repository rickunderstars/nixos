{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
  ];

  imports = [
    ./term/cava
    ./term/fish
  ];

    home.pointerCursor.size = 64;
}
