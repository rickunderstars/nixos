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
        "lastgenre"
        "duplicates"
        "badfiles"
        "permissions"
      ];

      permissions = {
        file = "644";
        dir = "755";
      };

      lastgenre = {
        canonical = true;
      };
    };
  };
}
