{
  pkgs,
  config,
  inputs,
  ...
}:

{
  home = {
    username = "riki";
    homeDirectory = "/home/riki";

    packages = [ ];

    pointerCursor = {
      gtk.enable = true;
      enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
    };

    file = {
      ".arduinoIDE/.clang-format" = {
        source = ./assets/arduino/.clang-format;
      };

      # using mkOutOfStoreSymlink avoids copying files
      ".assets".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/users/riki/assets";
    };
  };

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./assets/scripts/scripts.nix
    ./shared
  ];
}
