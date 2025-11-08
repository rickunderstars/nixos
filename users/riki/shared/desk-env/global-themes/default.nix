{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  xdg.configFile = {
    "kdeglobals".text = ''
      [Icons]
      Theme=Papirus-Dark

      [General]
      fixed=CaskaydiaCove Nerd Font Mono,12,-1,5,50,0,0,0,0,0
      font=CaskaydiaCove Nerd Font Mono,12,-1,5,50,0,0,0,0,0
      menuFont=CaskaydiaCove Nerd Font Mono,12,-1,5,50,0,0,0,0,0
      toolBarFont=CaskaydiaCove Nerd Font Mono,12,-1,5,50,0,0,0,0,0
    '';

    "dolphinrc".text = ''
      [General]
      ViewPropsTimestamp=2024,1,1,0,0,0
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita:dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 11;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita:dark";
        icon-theme = "Papirus-Dark";
      };
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };
}
