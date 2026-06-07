{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  networking.hostName = "case";

  # Hardware-specific logic
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  hardware.openrazer = {
    enable = true;
    keyStatistics = true;
    batteryNotifier = {
      enable = true;
      percentage = 15;
      frequency = 600;
    };
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
    linuxKernel.packages.linux_zen.xone
  ];

  programs.gamescope.args = [
    "--prefer-output DP-2"
    "-w 1920 -h 1080"
    "-W 1920 -H 1080"
    "-r 200"
    "--mangoapp"
    "--fullscreen"
    "--backend wayland"
    "--force-grab-cursor"
    "--rt"
  ];

  time.hardwareClockInLocalTime = true;
  boot.kernelParams = [ "amd_pstate=disable" ];
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.05";
}
