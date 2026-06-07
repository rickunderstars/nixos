{ ... }:

{
  programs.waybar = {
    style = ./tars-style.css;
    settings = {
      mainBar = {
        cava = {
          bars = 12;
        };
      };
    };
  };
}
