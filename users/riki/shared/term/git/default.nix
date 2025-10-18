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
    userName = "riki";
    userEmail = "rickunderstars@gmail.com";
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
    delta = {
      enable = true;
      options = {
        features = "catppuccin-mocha";
        side-by-side = true;
      };
    };
    includes = [
      {
        path = ./catppuccin.gitconfig;
      }
    ];
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = true;
    extraConfig = ''
      Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
    '';
  };

  services.ssh-agent.enable = true;
}
