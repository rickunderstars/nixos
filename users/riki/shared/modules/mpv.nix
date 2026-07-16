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
    };
    profiles = {
      "extension.gif" = {
        loop-file = "inf";
      };
      "audio-only" = {
        profile-cond = ''get("vid") == false or get("current-tracks/video/image") == true'';
        # force-window = "no";
        fullscreen = "no";
      };
    };
    scriptOpts = {
      autoload = {
        videos = true;
        audio = false;
        images = false;
        same_type = true;
      };
      uosc = {
        color = "foreground=b4befe,foreground_text=313244,background=000000,background_text=cdd6f4,curtain=181825,success=a6e3a1,error=f38ba8";
      };
    };
    scripts = with pkgs; [
      # mpvScripts.uosc
      mpvScripts.modernx
      mpvScripts.thumbfast
      mpvScripts.mpris
      mpvScripts.sponsorblock
      mpvScripts.quality-menu
      mpvScripts.autoload
      mpvScripts.mpv-cheatsheet-ng
    ];
  };
}
