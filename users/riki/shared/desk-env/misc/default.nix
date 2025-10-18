{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services = {
    hyprpolkitagent.enable = true;

    gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };
  };

}
