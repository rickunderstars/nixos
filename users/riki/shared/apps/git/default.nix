{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

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
        path = ../../../assets/git/catppuccin.gitconfig;
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
    matchBlocks = {
      "*" = {
        sendEnv = [
          "LANG"
          "LC_*"
        ];
        hashKnownHosts = true;
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
