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
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.loader.grub.theme = ./grub-theme/catppuccin-mocha-grub-theme;

  ### disable psr, could work or break everything
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

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
    xserver = {
      videoDrivers = [ "amdgpu" ];
    };

  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
