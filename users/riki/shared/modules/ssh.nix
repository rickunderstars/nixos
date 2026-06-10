{ ... }:

{
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

      "tars" = {
        HostName = "tars.local";
        User = "riki";
        IdentityFile = "~/.ssh/id_ed25519";
        IdentitiesOnly = true;
      };

      "case" = {
        HostName = "case.local";
        User = "riki";
        IdentityFile = "~/.ssh/id_ed25519";
        IdentitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
