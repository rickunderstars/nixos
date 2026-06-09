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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        SendEnv = "LANG LC_*";
        HashKnownHosts = true;
      };

      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519";
        IdentitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
