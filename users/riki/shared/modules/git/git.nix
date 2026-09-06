{ ... }:

{
  programs.git = {
    settings = {
      user.name = "riki";
      user.email = "rickskimsclouds+git@gmail.com";
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
    enableGitIntegration = true;
    options = {
      features = "catppuccin-mocha";
      side-by-side = true;
    };
  };
}
