{
  pkgs,
  ...
}:
{
  programs.mpv = {
    config = {
      background-color = "#000000";
      # background-color = "#1e1e2e";
      osd-back-color = "#11111b";
      osd-border-color = "#11111b";
      osd-color = "#cdd6f4";
      osd-shadow-color = "#1e1e2e";
      ao = "pipewire";
      fullscreen = "yes";
      osc = false;
      osd-bar = false;
      border = false;
      slang = "eng,ita";
      alang = "eng,ita";
      save-position-on-quit = true;
      ignore-path-in-watch-later-config = true;
      cache = "yes";
      load-stats-overlay = false;
      screenshot-directory = "~/Pictures/Screenshots/";
      screenshot-format = "png";
      screenshot-template = "%F.%P.mpv.shot.%02n";
    };
    profiles = {
      "extension.gif" = {
        loop-file = "inf";
      };
    };
    scripts = with pkgs; [
      mpvScripts.modernz
      mpvScripts.thumbfast
      mpvScripts.mpris
      mpvScripts.sponsorblock
      mpvScripts.quality-menu
      mpvScripts.autoload
      mpvScripts.mpv-cheatsheet-ng
      mpvScripts.visualizer
    ];
    scriptOpts = {
      autoload = {
        videos = true;
        audio = false;
        images = false;
        same_type = true;
      };
      visualizer = {
        name = "showcqt";
        quality = "veryhigh";
        height = 12;
      };
    };
  };
}
