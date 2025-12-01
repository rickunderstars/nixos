{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  programs.mpv = {
    enable = true;
    config = {
      background-color = "#1e1e2e";
      osd-back-color = "#11111b";
      osd-border-color = "#11111b";
      osd-color = "#cdd6f4";
      osd-shadow-color = "#1e1e2e";
      ao = "pulse";
      fullscreen = "yes";

    };
    scriptOpts = {
      stats = {
        border_color = "#251818";
        font_color = "#f4d6cd";
        plot_bg_border_color = "#febeb4";
        plot_bg_color = "#251818";
        plot_color = "#febeb4";
      };
      uosc = {
        color = "foreground=b4befe,foreground_text=313244,background=1e1e2e,background_text=cdd6f4,curtain=181825,success=a6e3a1,error=f38ba8";
      };
    };
    scripts = [
      pkgs.mpvScripts.uosc
      pkgs.mpvScripts.thumbfast
    ];
  };
}
