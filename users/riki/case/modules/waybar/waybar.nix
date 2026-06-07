{ ... }:

{
  programs.waybar = {
    style = ./case-style.css;
    settings = {
      mainBar = {
        cava = {
          bars = 32;
        };
      };
    };
  };
}
