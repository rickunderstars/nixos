{ ... }:

{
  services = {
    clipman.enable = true;
    playerctld.enable = true;
    easyeffects.enable = true;
    awww = {
      enable = true;
      extraArgs = [];
    };
    dunst.enable = true;
    gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };
    hypridle.enable = true;
    ssh-agent.enable = true;
    swayosd.enable = true;
    udiskie.enable = true;
  };
}
