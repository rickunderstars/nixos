{
  pkgs,
  ...
}:
{
  programs.onedrive = {
    settings = {
      no_remote_delete = "false";
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
      ExecStart = "${pkgs.onedrive}/bin/onedrive --synchronize";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.timers.onedrive = {
    Unit = {
      Description = "OneDrive periodic sync";
    };
    Timer = {
      OnCalendar = "*:0/3";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
