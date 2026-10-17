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
    exfatprogs
    dosfstools
    catppuccin
    catppuccin-cursors.mochaDark
    android-tools
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    noto-fonts-color-emoji
  ];
}
