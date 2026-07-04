{ ... }:

{
  programs.fish = {

    functions = {
      mirror = "wl-mirror eDP-1 & sleep 0.5 && niri msg action fullscreen-window && niri msg action move-column-to-monitor-next && niri msg action focus-monitor-previous";
      lid-is-closed = ''
        set -l lid_path /proc/acpi/button/lid/*/state

        if not test -e $lid_path
            return 2
        end

        string match -q '*closed*' (cat $lid_path)
      '';
      is-charging = ''
        set -l ac_path /sys/class/power_supply/A*/online

        if not test -e $ac_path
            return 2
        end

        test (cat $ac_path) = "1"
      '';
    };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#tars --show-trace";
      nrb = "sudo nixos-rebuild boot --flake ~/nixos-config#tars --show-trace";

      # charges battery to 100% once (resets automatically)
      fullcharge = "sudo tlp fullcharge BAT0";
    };
  };
}
