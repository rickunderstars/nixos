{
  pkgs,
  ...
}:

{
  systemd.packages = [ pkgs.swayosd ];
  systemd.services.swayosd-libinput-backend.wantedBy = [ "graphical.target" ];
  services.dbus.packages = [ pkgs.swayosd ];

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    logind.settings.Login = {
      HandlePowerKey = "ignore";
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };
    gvfs.enable = true;
    udisks2.enable = true;
    gnome = {
      gnome-keyring.enable = true;
      gnome-settings-daemon.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
  };
}
