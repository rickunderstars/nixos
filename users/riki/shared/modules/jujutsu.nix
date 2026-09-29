{ ... }:

{
  programs.jujutsu = {
    settings = {
      user = {
        email = "rickskimsclouds+git@proton.me";
        name = "riki";
      };
      ui = {
        diff.tool = "delta";
        default-command = "log";
      };
    };
  };
}
