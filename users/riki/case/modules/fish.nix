{ ... }:

{
  programs.fish = {
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#case --show-trace";
      nrb = "sudo nixos-rebuild boot --flake ~/nixos-config#case --show-trace";
    };
  };
}
