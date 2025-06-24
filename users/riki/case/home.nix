{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
  ];

  imports = [
    ./term/cava
    ./term/fish
  ];
}
