{ ... }:

{
  programs.jujutsu = {
    settings = {
      user = {
        email = "rickunderstars@gmail.com";
        name = "riki";
      };
      ui = {
        diff.tool = "delta";
        default-command = "log";
      };
    };
  };
}
