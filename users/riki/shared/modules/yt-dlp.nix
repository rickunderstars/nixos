{
  config,
  ...
}:

{
  programs.yt-dlp = {
    settings = {
      merge-output-format = "mkv";
      embed-thumbnail = true;
      convert-thumbnails = "jpg";
      embed-subs = true;
      sub-langs = "en.*,it";
      sponsorblock-mark = "all";
      prefer-free-formats = true;

      output = ''"%(playlist_title)s/%(playlist_index|)s%(playlist_index& - |)s%(title)s.%(ext)s"'';

      download-archive = "${config.xdg.configHome}/yt-dlp/archive.txt";
    };

  };
}
