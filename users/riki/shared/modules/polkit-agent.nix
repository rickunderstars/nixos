{
  pkgs,
  ...
}:

{
  systemd.user.services.polkit-agent = {
    Unit = {
      Description = "Polkit authentication agent";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
