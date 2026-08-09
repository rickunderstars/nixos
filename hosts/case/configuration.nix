{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  fileSystems."/home/riki/mnt/ssd" = {
    device = "/dev/disk/by-uuid/440bb6bb-09e3-4dd0-a481-b57921a0bf45";
    fsType = "ext4";
    options = [
      "nofail"
      "users"
      "exec"
      "x-gvfs-show"
    ];
  };

  fileSystems."/home/riki/mnt/hdd" = {
    device = "/dev/disk/by-uuid/c45c2cf3-4d92-4961-95e4-6f461a246cbc";
    fsType = "ext4";
    options = [
      "nofail"
      "users"
      "exec"
      "x-gvfs-show"
    ];
  };

  systemd.tmpfiles.rules = [
    "z /home/riki/mnt/ssd 0755 riki users -"
    "z /home/riki/mnt/hdd 0755 riki users -"
  ];

  networking.hostName = "case";

  # Hardware-specific logic
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

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

  programs.gamescope = {
    package = pkgs.gamescope;
    args = [
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
  };

  time.hardwareClockInLocalTime = true;
  boot.kernelParams = [ "amd_pstate=disable" ];
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.05";
}
