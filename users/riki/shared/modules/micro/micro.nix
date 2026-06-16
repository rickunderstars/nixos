{ ... }:

{
  programs.micro = {
    enable = true;
    settings = {
      autosave = 5;
      softwrap = true;
      wordwrap = true;
      autoclose = true;
      colorscheme = "catppuccin-mocha";
    };
  };

  xdg.configFile."micro/colorschemes/catppuccin-mocha.micro".source = ./catppuccin-mocha.micro;
}
