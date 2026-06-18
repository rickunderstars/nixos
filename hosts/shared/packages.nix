{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    os-prober
    gparted
    brightnessctl
    procps
    distrobox
    xwayland-satellite
    exfatprogs
    dosfstools
    catppuccin
    catppuccin-cursors.mochaDark
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.roboto-mono
    roboto
  ];
}
