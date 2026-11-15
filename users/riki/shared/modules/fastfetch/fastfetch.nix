{
  config,
  ...
}:

{
  programs.fastfetch = {
    settings = {
      logo = {
        type = "kitty";
        animationFrame = 0;
        source = "${./logos/starfield.gif}";
        padding = {
          left = 0;
          right = 3;
          top = 0;
        };
      };
      display = {
        separator = "";
        key.width = 15;
        color = {
          output = "italic_bold_#cdd6f4";
        };
      };
    };
  };

  home.file.".logos".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/users/riki/shared/modules/fastfetch/logos";
}
