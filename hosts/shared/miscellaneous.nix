{ ... }:

{
  hardware = {
    graphics.enable = true;
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    steam-hardware.enable = true;
    uinput.enable = true;
    xone.enable = true;
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  musnix.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock.enableGnomeKeyring = true;
  };

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  qt.enable = true;
}
