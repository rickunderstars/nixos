{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    os-prober
    gparted
    brightnessctl
    procps
    distrobox
    hyprland-qt-support
    hyprpolkitagent
    exfatprogs
    dosfstools
    catppuccin
    catppuccin-cursors.mochaDark
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
}
