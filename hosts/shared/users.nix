{ pkgs, ... }:

{
  users.users.riki = {
    isNormalUser = true;
    description = "riki";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICdoRyVI03LsqevvuNXq+fIRrqdcqACkTHB0gDwC4btj rickunderstars@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvLHOn57SHTqJl8/GC3SGBJP3/Wbartww29PpOyHQ3n rickunderstars@gmail.com"
    ];
    extraGroups = [
      "networkmanager"
      "bluetooth"
      "wheel"
      "openrazer"
      "dialout"
      "uucp"
      "audio"
      "video"
      "input"
      "plugdev"
      "storage"
      "uinput"
    ];
    shell = pkgs.fish;
  };

  services.getty.autologinUser = "riki";
}
