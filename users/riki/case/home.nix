{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    razer-cli
    nvitop
  ];

  imports = [
    ./term/ghostty.nix
    ./term/cava.nix
    ./term/fish.nix
    ./term/fastfetch.nix
    ./desk-env/hyprland.nix
    ./desk-env/hyprlock.nix
    ./desk-env/waybar.nix
  ];

}
