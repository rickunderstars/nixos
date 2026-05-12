{ ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        fail_timeout = 700;
      };
      background = [
        {
          path = "~/.assets/walls/Cloudsnight.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
    };
  };
}
