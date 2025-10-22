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

  # disable psr [laptop has issue]
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

  # hostname
  networking.hostName = "tars";

  environment.systemPackages = with pkgs; [
  ];

  programs = {
    gamescope = {
      args = [
        "-w 2880 -h 1800" # game resolution
        "-W 2880 -H 1800" # window resolution
        #"-F fsr" # upscaling method
        "--mangoapp" # mangohud
        "-r 120" # max fps
        "--fullscreen"
        "--backend wayland"
        "--force-grab-cursor"
        "--rt" # real time priority
      ];
    };
  };

  services = {
    # disable gnome power profile management
    power-profiles-daemon.enable = false;

    # enable tlp power profile management
    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";

        START_CHARGE_THRESH_BAT0 = 0; # dummy value
        STOP_CHARGE_THRESH_BAT0 = 1; # 1 = 80%; 0 = 100%
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
