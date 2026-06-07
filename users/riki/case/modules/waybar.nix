{ ... }:

{
  programs.waybar = {
    style = ../../assets/waybar/case-style.css;
    settings = {
      mainBar = {
        cava = {
          bars = 32;
        };
      };
    };
  };
}
