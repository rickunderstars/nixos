{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 30; # 30sec - turn off keyboard backlight
          on-timeout = "brightnessctl -sd platform::kbd_backlight set 0";
          on-resume = "brightnessctl -rd platform::kbd_backlight";
        }
        {
          timeout = 300; # 5min - lower screen brightness
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 360; # 6min - lock screen
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 1800; # 30min - suspend
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
