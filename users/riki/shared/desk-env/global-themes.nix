{ pkgs, ... }:
{

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-lavender-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;

      # name = "Catppuccin-Mocha-Lavender";
      # package = pkgs.catppuccin-papirus-folders.override {
      #    flavor = "mocha";
      #    accent = "lavender";
      # };
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

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    (pkgs.catppuccin-kvantum.override {
      accent = "lavender";
      variant = "mocha";
    })
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Catppuccin-Mocha-Lavender
  '';
}
