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
      ".config/micro/colorschemes/catppuccin-mocha.micro" = {
        source = ./assets/micro/catppuccin-mocha.micro;
      };
      ".arduinoIDE/.clang-format" = {
        source = ./assets/arduino/.clang-format;
      };
      ".config/ghostty/shaders/cursor_warp.glsl" = {
        source = ./assets/ghostty/cursor_warp.glsl;
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
