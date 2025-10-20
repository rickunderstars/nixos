{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

# rise = - ( BaseSizePt * ( (Percentage / 100) - 1 ) / 2 ) * 1024

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "cava"
        ];
        modules-right = [
          "tray"
          "backlight"
          "idle_inhibitor"
          "wireplumber"
          "cpu"
          "bluetooth"
          "network"
          "battery"
          "clock"
        ];
        spacing = 4;
        mode = "dock";
        reload_style_on_change = true;

        battery = {
          states = {
            warning = 15;
            critical = 5;
          };
          interval = 1;
          format = "{icon}{capacity}";
          format-icons = [
            "[     ]"
            "[/    ]"
            "[//   ]"
            "[///  ]"
            "[//// ]"
            "[/////]"

          ];
          format-charging = "[󱐋󱐋󱐋󱐋󱐋]{capacity}";
          format-warning = "[!!!!!]{capacity}";
          tooltip-format = "PD: {power}W\n{timeTo}";
        };

        bluetooth = {
          format-on = "<span font_size='145%' rise='-2304'></span>";
          format-off = "<span font_size='145%' rise='-2304'>󰂲</span>";
          format-connected = "<span font_size='145%' rise='-2304'>󰂱</span>";
          tooltip-format = "bluetooth {status}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias}";

          on-click = "ghostty -e bluetui";
        };

        cpu = {
          interval = 2;
          format = "<span font_size='150%' rise='-2560'></span> {usage} {max_frequency}GHz";
          on-click = "ghostty -e btop";
        };

        cava = {
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          bars = 12;
          framerate = 120;
          hide_on_silence = false;
          bar_delimiter = 0;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "{:%a %d-%b-%Y}";
          format = "{:%H:%M}";
        };

        network = {
          interval = 5;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤥"
            "󰤨"
          ];
          format-wifi = "{essid}<span font_size='165%' rise='-3328'>{icon}</span>";
          format-ethernet = "{ifname}<span font_size='165%' rise='-3328'>󰈀</span>";
          format-disconnected = "<span font_size='165%' rise='-3328'>󰤭</span>";
          tooltip-format = "";
          tooltip-format-wifi = "SSID: {essid}\nstrength: {signalStrength}";
          tooltip-format-ethernet = "ifname: {ifname}";
          tooltip-format-disconnected = "";

          on-click = "ghostty -e nmtui";
        };

        wireplumber = {
          format-icons = [
            "     |"
            "󰥛    |"
            "󰥛󰥛   |"
            "󰥛󰥛󰥛  |"
            "󰥛󰥛󰥛󰥛 |"
            "󰥛󰥛󰥛󰥛󰥛|"
          ];
          format-muted = "<span font_size='180%' rise='-4096'></span>|{volume}";
          format = "<span font_size='180%' rise='-4096'></span>{icon}{volume}";
          tooltip-format = "{node_name}";
          scroll-step = 2.5;
          reverse-scrolling = true;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        idle_inhibitor = {
          format = "<span font_size='160%'>{icon}</span>";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰒲";
          };
          tooltip-format-activated = "caffeinated";
          tooltip-format-deactivated = "no caffeine";
        };

        backlight = {
          format = "<span font_size='200%'>{icon}</span>";
          format-icons = [
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
          tooltip-format = "brightness: {percent}";
          reverse-scrolling = true;
        };

      };

    };
  };
}
