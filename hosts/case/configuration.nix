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

  # razer
  hardware = {
    openrazer = {
      enable = true;
      batteryNotifier = {
        percentage = 15;
        frequency = 3600;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
    linuxKernel.packages.linux_zen.xone
  ];

  programs = {
    gamescope = {
      args = [
        "--prefer-output DP-3" # monitor preference
        "-w 1920 -h 1080" # game resolution
        "-W 1920 -H 1080" # window resolution
        "-F fsr" # upscaling method
        "--mangoapp" # mangohud
        "-f"
        "--force-grab-cursor"
        "--rt" # real time priority
      ];
    };
  };

  time.hardwareClockInLocalTime = true;

  boot.kernelParams = [ "amd_pstate=disable" ];
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.05";
}
