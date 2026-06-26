{ ... }:

{
  programs.bat = {
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
