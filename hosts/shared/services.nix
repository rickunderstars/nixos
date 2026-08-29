{
  pkgs,
  lib,
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
    locate = {
      enable = true;
      interval = "22:00";
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
    navidrome = {
      enable = true;
      settings = {
        MusicFolder = "/home/riki/OneDrive/media/music";
        Address = "127.0.0.1";
        EnableSharing = true;
        LyricsPriority = ".ttml,.yaml,.yml,.elrc,.srt,lyrics-plugin,embedded,.lrc,.txt";
      };
      plugins = with pkgs.navidromePlugins; [
        audiomuseai
        apple-music
        listenbrainz-daily-playlist
      ];
    };
    fwupd.enable = true;
    printing.enable = true;
  };
  systemd.services.navidrome.serviceConfig = {
    ProtectHome = lib.mkForce "read-only";
    BindReadOnlyPaths = [ "/home/riki/OneDrive/media/music" ];
  };
}
