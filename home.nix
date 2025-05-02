{ config, pkgs, ... }:

{
	home.stateVersion = "24.11";

home-manager.users.riki = {
  home.stateVersion = "24.11";
  programs.onedrive = {
    enable = true;
    settings = {
      sync_dir = "~/OneDrive";
    };
  };
};
}