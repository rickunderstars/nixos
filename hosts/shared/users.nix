{ pkgs, ... }:

{
  users.users.riki = {
    isNormalUser = true;
    description = "riki";
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
