{ ... }:

{
  services.swayosd = {
    enable = true;
  };

  xdg.configFile."swayosd/style.css".source = ./style.css;
}
