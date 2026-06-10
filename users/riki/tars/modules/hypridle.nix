{ ... }:

{
  services.hypridle = {
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "niri msg action power-on-monitors";
      };

      listener = [
        {
          timeout = 10; # 10sec - turn off keyboard backlight
          on-timeout = "brightnessctl -sd platform::kbd_backlight set 0%";
          on-resume = "brightnessctl -rd platform::kbd_backlight";
        }
        {
          timeout = 20; # 20sec - lower screen brightness
          on-timeout = "brightnessctl -s; [ $(brightnessctl get) -gt 63840 ] && brightnessctl set 16%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 60; # 1min - lock screen
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 120; # 2min - turn off screen
          on-timeout = "niri msg action power-off-monitors";
          on-resume = "niri msg action power-on-monitors";
        }
        {
          timeout = 600; # 10min - suspend
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
