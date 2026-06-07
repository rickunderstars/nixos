{ config, ... }:

{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      extraConfig = {
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      onlyoffice-desktopeditors = {
        name = "OnlyOffice";
        exec = "env QT_SCALE_FACTOR=1 onlyoffice-desktopeditors %U";
        terminal = false;
        categories = [ "Office" ];
      };
      youtube = {
        name = "YouTube";
        exec = "zen-twilight --new-window https://www.youtube.com";
        terminal = false;
        categories = [
          "Network"
          "Video"
        ];
      };
      instagram = {
        name = "Instagram";
        exec = "zen-twilight --new-window https://www.instagram.com";
        terminal = false;
        categories = [
          "Network"
          "InstantMessaging"
          "Chat"
          "Photography"
        ];
      };
    };
  };
}
