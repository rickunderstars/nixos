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

  home.file.".config/micro/colorschemes/catppuccin-mocha.micro".source = ./catppuccin-mocha.micro;
}
