{
  pkgs,
  ...
}:
{
  programs.mpv = {
    enable = true;
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
    };
    profiles = {
      "extension.gif" = {
        loop-file = "inf";
      };
      "audio-only" = {
        profile-cond = ''get("vid") == false or get("current-tracks/video/image") == true'';
        force-window = "no";
      };
    };
    scriptOpts = {
      autoload = {
        videos = true;
        audio = false;
        images = false;
        same_type = true;
      };
    };
    scripts = [
      pkgs.mpvScripts.modernx
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.mpris
      pkgs.mpvScripts.sponsorblock
      pkgs.mpvScripts.quality-menu
      pkgs.mpvScripts.autoload
      pkgs.mpvScripts.mpv-cheatsheet-ng
    ];
  };
}
