{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "riki";
      user.email = "rickunderstars@gmail.com";
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
    includes = [
      {
        path = "${./catppuccin.gitconfig}";
      }
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      features = "catppuccin-mocha";
      side-by-side = true;
    };
  };
}
