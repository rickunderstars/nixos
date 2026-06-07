{ ... }:

{
  programs.bat = {
    enable = true;
    themes = {
      catppuccin-mocha = {
        src = "${./.}";
        file = "catppuccin-mocha.tmTheme";
      };
    };
    config = {
      theme = "catppuccin-mocha";
    };
  };
}
