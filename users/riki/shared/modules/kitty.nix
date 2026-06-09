{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
      mode = "no-cursor";
    };
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 12;
    };
    settings = {
      background_opacity = "0.75";
      cursor_shape = "underline";
      mouse_hide_wait = "3.0";
      window_padding_width = 16;
      hide_window_decorations = "no";
    };
  };
}
