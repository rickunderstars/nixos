{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    nautilus
    adwaita-icon-theme
    glib
    gsettings-desktop-schemas
    gnome.gvfs
    gnome-settings-daemon
    gnome-themes-extra

    (catppuccin-gtk.override {
      accents = [ "lavender" ];
      size = "standard";
      tweaks = [ "rimless" ];
      variant = "mocha";
    })

  ];

  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Lavender";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
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

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "icon-view";
        search-filter-time-type = "last_modified";
        show-create-link = true;
        show-delete-permanently = true;
        show-hidden-files = false;
      };

      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "standard";
      };

      "org/gnome/nautilus/list-view" = {
        default-zoom-level = "standard";
        use-tree-view = false;
      };

      "org/gnome/desktop/interface" = {
        gtk-theme = config.gtk.theme.name;
        icon-theme = config.gtk.iconTheme.name;
        color-scheme = "prefer-dark";
        gtk-application-prefer-dark-theme = true;
      };

      "org/gnome/desktop/wm/preferences" = {
        theme = config.gtk.theme.name;
      };
    };
  };

}
