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
          timeout = 16; # turn off keyboard backlight
          on-timeout = "brightnessctl -sd platform::kbd_backlight set 0%";
          on-resume = "brightnessctl -rd platform::kbd_backlight";
        }
        {
          timeout = 32; # lower screen brightness (63840 is 16% of max tars value)
          on-timeout = "brightnessctl -s; [ $(brightnessctl get) -gt 63840 ] && brightnessctl set 16%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 64; # lock screen
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 128; # turn off screen
          on-timeout = "niri msg action power-off-monitors";
          on-resume = "niri msg action power-on-monitors";
        }
        {
          timeout = 512; # suspend
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
