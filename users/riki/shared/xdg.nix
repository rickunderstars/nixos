{ config, ... }:

{
  xdg = {
    mimeApps.enable = true;
    configFile = {
      "swayosd/style.css".source = ./modules/swayosd/style.css;
      "niri/config.kdl".source = ./modules/niri/config.kdl;
      "pomo/pomo.yaml".source = ./modules/pomo/pomo.yaml;
    };
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
      codium-new-window = {
        name = "VSCodium (new window)";
        exec = "codium --new-window %F";
        terminal = false;
        type = "Application";
        mimeType = [ "text/plain" ];
      };
      zen-new-window = {
        name = "Zen Browser (new window)";
        exec = "zen-twilight --new-window %U";
        terminal = false;
        type = "Application";
        mimeType = [ "application/pdf" ];
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
