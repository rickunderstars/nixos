{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];
  # hostname
  networking.hostName = "case";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "25.05";
}
