{ ... }:

{
  services.dunst = {
    settings = {
      global = {
        timeout = 2;
        font = "CaskaydiaCove Nerd Font Mono 12";
        width = 300;
        height = "(0, 300)";
        offset = "13x5";
        frame_width = 2;
        corner_radius = 8;
        follow = "mouse";
        icon_position = "left";
        icon_corner_radius = 5;
        max_icon_size = 64;
        alignment = "center";

        # catppuccin mavue
        background = "#1e1e2e80";
        foreground = "#cdd6f4ff";
        frame_color = "#cba6f7ff";
        highlight = "#313244ff";
      };

      urgency_critical = {
        frame_color = "#f5c2e7ff";
        timeout = 10;
      };
    };
  };
}
