{ ... }:

{
  programs.beets = {
    settings = {
      directory = "~/OneDrive/media/music";
      library = "~/OneDrive/media/music/musiclibrary.blb";

      import = {
        move = true;
        write = true;
        quiet = true;
        quiet_fallback = "asis";
      };

      plugins = [
        "fetchart"
        # "lyrics"
        "lastgenre"
        "duplicates"
        "badfiles"
      ];

      lyrics = {
        auto = true;
        sources = [ "lrclib" ];
        fallback = "";
        force = false;
      };
    };
  };
}
