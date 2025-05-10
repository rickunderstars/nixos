{
  config,
  pkgs,
  lib,
  ...
}:

{
  systemd.user.services.onedrive = {
    Unit = {
      Description = "onedrive-riki";
      After = [
        "network-online.target"
        "graphical-session.target"
      ];
      Wants = [
        "network-online.target"
        "graphical-session.target"
      ];
    };
    Service = {
      ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
      Restart = "on-failure";
      RestartSec = "10s";
      WorkingDirectory = "%h";
      Environment = "HOME=%h";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
