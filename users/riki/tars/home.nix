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
    geteduroam
  ];

  imports = [
    ./term/cava.nix
    ./term/fish.nix
    ./term/fastfetch.nix
    ./desk-env/hyprland.nix
    ./desk-env/hypridle.nix
    ./desk-env/hyprlock.nix
    ./desk-env/waybar.nix
  ];

}
