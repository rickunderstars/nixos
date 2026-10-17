{ ... }:

{
  imports = [
    ./input.nix
    ./environment.nix
    ./layout.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    settings = {
      prefer-no-csd = { };
      blur = {
        passes = 2;
        offset = 4.0;
      };
      cursor = {
        hide-when-typing = { };
        hide-after-inactive-ms = 4096;
      };
      overview = {
        zoom = 0.45;
        backdrop-color = "#1e1e2e";
      };
      recent-windows = {
        highlight = {
          active-color = "#94e2d5";
          urgent-color = "#fab387";
          padding = 16;
          corner-radius = 8;
        };
        previews.max-scale = 0.4;
      };
      hotkey-overlay = {
        skip-at-startup = { };
        hide-not-bound = { };
      };
      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
      animations.slowdown = 0.8;

      # spawn at startup
      _children = [
        {
          spawn-at-startup._args = [
            "nawww"
            "--init"
          ];
        }
        { spawn-at-startup._args = [ "hyprlock" ]; }
        { spawn-at-startup._args = [ "hypridle" ]; }
        {
          spawn-at-startup._args = [
            "bluetoothctl"
            "power"
            "off"
          ];
        }
        {
          spawn-at-startup._args = [
            "fish"
            "-c"
            "chameleos -w 5 -c '#d20f39'"
          ];
        }
        {
          spawn-at-startup._args = [
            "fish"
            "-c"
            "toggle-msg-notif"
          ];
        }
      ];
    };
  };
}
