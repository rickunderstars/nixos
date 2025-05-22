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

  # keyboard  fix (key repeat)
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # hostname
  networking.hostName = "tars";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services = {
    # disable gnome power profile management
    power-profiles-daemon.enable = false;

    # enable tlp power profile management
    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";

        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 0;

        START_CHARGE_THRESH_BAT1 = 0;
        STOP_CHARGE_THRESH_BAT1 = 0;
      };
    };

    # amd video drivers
    xserver.videoDrivers = [ "amdgpu" ];

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
