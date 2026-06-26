{ config, pkgs, ... }:

{
  programs.superfile = {
    settings = {
      theme = "catppuccin";
      auto_check_update = false;
      transparent_background = true;
      default_open_file_preview = true;
      shell_close_on_success = true;
      show_image_preview = true;
      default_sort_type = 2;
      case_sensitive_sort = false;
      code_previewer = "bat";
      nerdfont = true;
      metadata = true;
      zoxide_support = true;
    };
    pinnedFolders = [
      {
        name = "Screenshots";
        location = "${config.home.homeDirectory}/Pictures/Screenshots";
      }
      {
        name = "Onedrive";
        location = "${config.home.homeDirectory}/OneDrive";
      }
    ];
    metadataPackage = pkgs.exiftool;
    zoxidePackage = pkgs.zoxide;
  };
}
