{ ... }:

{
  programs.jujutsu = {
    settings = {
      user = {
        email = "rickskimsclouds+git@gmail.com";
        name = "riki";
      };
      ui = {
        diff.tool = "delta";
        default-command = "log";
      };
    };
  };
}
