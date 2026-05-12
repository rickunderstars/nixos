{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];
  # hostname
  networking.hostName = "case";

  # nvidia gpu
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  hardware = {
    # razer
    openrazer = {
      enable = true;
      keyStatistics = true;
      batteryNotifier = {
        enable = true;
        percentage = 15;
        frequency = 600;
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
        "--prefer-output DP-2" # monitor preference
        "-w 1920 -h 1080" # game resolution
        "-W 1920 -H 1080" # window resolution
        "-r 200" # fps
        #"-F fsr" # upscaling method
        "--mangoapp" # mangohud
        "--fullscreen"
        "--backend wayland"
        "--force-grab-cursor"
        "--rt" # real time priority
      ];
    };
  };

  time.hardwareClockInLocalTime = true;

  boot.kernelParams = [ "amd_pstate=disable" ];
  services.power-profiles-daemon.enable = true;

  services = {
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  system.stateVersion = "25.05";
}
