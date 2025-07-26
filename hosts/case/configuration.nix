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

  boot.kernelParams = [ "amd_pstate=disable" ];
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.05";
}
