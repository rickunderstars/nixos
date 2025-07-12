{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  programs.onedrive = {
    enable = true;
    settings = {
      monitor_interval = "180";
    };
  };
  systemd.user.services.onedrive = {
    Unit = {
      Description = "OneDrive sync service";
      After = "network-online.target";
      Wants = "network-online.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
