{ ... }:

{
  programs.fish = {

    functions = {
      mirror = "wl-mirror eDP-1 & sleep 0.5 && niri msg action fullscreen-window && niri msg action move-column-to-monitor-next && niri msg action focus-monitor-previous";
    };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#tars --show-trace";
      nrb = "sudo nixos-rebuild boot --flake ~/nixos-config#tars --show-trace";

      # charges battery to 100% once (resets automatically)
      fullcharge = "sudo tlp fullcharge BAT0";
    };
  };
}
