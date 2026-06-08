{ pkgs, ... }:

{
  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    steam-hardware.enable = true;
    uinput.enable = true;
    xone.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock.text = "auth include login";
  };

  services = {
    logind.settings.Login.HandlePowerKey = "ignore";
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

  programs = {
    dconf.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = true;
    };
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      };
    };
  };

  qt.enable = true;

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };
}
