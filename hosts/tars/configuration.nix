{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  networking.hostName = "tars";

  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

  services = {
    xserver.videoDrivers = [ "amdgpu" ];
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      pd.enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
      };
    };
  };

  programs.gamescope.args = [
    "-w 2880 -h 1800"
    "-W 2880 -h 1800"
    "--mangoapp"
    "-r 120"
    "--fullscreen"
    "--backend wayland"
    "--force-grab-cursor"
    "--rt"
  ];

  system.stateVersion = "24.11";
}
