{ ... }:

# rise = - ( BaseSizePt * ( (Percentage / 100) - 1 ) / 2 ) * 1024

{
  programs.waybar = {
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mode = "dock";
        reload_style_on_change = true;

        "niri/window" = {
          format = "{app_id}";
          separate-outputs = true;
          icon = true;
          icon-size = 20;
          rewrite = {
            "([^.]+)-.*" = "$1";
            ".*\\.(?!desktop$)([^.]+)$" = "$1";
            ".*\\.([^.]+)\\.desktop" = "$1";
          };
        };

        "niri/language" = {
          format = "{}";
          format-it = "IT";
          format-en = "EN";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "I";
            "2" = "II";
            "3" = "III";
            "4" = "IV";
            "5" = "V";
            "6" = "VI";
            "7" = "VII";
            "8" = "VIII";
            "9" = "IX";
            "10" = "X";
            "11" = "XI";
            "12" = "XII";
            "13" = "XIII";
            "14" = "XIV";
            "15" = "XV";
            "16" = "XVI";
            "17" = "XVII";
            "18" = "XVIII";
            "19" = "XIX";
            "20" = "XX";
          };
          on-scroll-up = "niri msg action focus-workspace-down";
          on-scroll-down = "niri msg action focus-workspace-up";
        };

        tray = {
          show-passive-items = true;
          spacing = 10;
        };

        cava = {
          format-icons = [
            "▁" # "▁"
            "🭻" # "▂"
            "🭺" # "▃"
            "🭹" # "▄"
            "🭸" # "▅"
            "🭷" # "▆"
            "🭶" # "▇"
            "▔" # "█"

          ];
          framerate = 120;
          hide_on_silence = false;
          bar_delimiter = 0;
        };

        wireplumber = {
          format-icons = [
            "󰥛    "
            "󰥛󰥛   "
            "󰥛󰥛󰥛  "
            "󰥛󰥛󰥛󰥛 "
            "󰥛󰥛󰥛󰥛󰥛"
          ];
          format-muted = "<span font_size='180%' rise='-4096'></span>|{volume}";
          format = "<span font_size='180%' rise='-4096'></span>{icon}|{volume}";
          tooltip-format = "{node_name}";
          scroll-step = 2.5;
          reverse-scrolling = true;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "fish -c 'pidof wiremix || kitty --class=wiremix.kitty -e wiremix'";
        };

        backlight = {
          format = "<span font_size='200%'>{icon}</span>";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "brightness: {percent}";
          reverse-scrolling = true;
        };

        "custom/idle-inhibitor" = {
          exec = ''systemctl --user is-active --quiet hypridle && echo '{"text":"󰒲","tooltip":"no caffeine","class":"deactivated"}' || echo '{"text":"󰈈","tooltip":"caffeinated","class":"activated"}' '';
          return-type = "json";
          format = "<span font_size='160%'>{}</span>";
          interval = 2;
          on-click = "fish -c idle-toggle";
        };

        memory = {
          interval = 10;
          format = "<span font_size='150%' rise='-2560'></span>{percentage}";
          on-click = "fish -c 'pidof btop || kitty --class=btop.kitty -e btop'";
        };

        cpu = {
          interval = 2;
          format = "<span font_size='150%' rise='-2560'> </span>{usage}";
          on-click = "fish -c 'pidof btop || kitty --class=btop.kitty -e btop'";
        };

        "custom/mouse-battery" = {
          exec = "mouse-battery";
          interval = 4;
          tooltip = true;
          tooltip-format = "Razer DeathAdder V3 Pro";
          format = "{}";
        };

        battery = {
          states = {
            warning = 16;
            critical = 8;
          };
          interval = 1;
          format = "{icon}{capacity}";
          format-icons = [
            "[     ]"
            "[    ]"
            "[   ]"
            "[  ]"
            "[ ]"
            "[]"
          ];
          format-charging = "[󱐋󱐋󱐋󱐋󱐋]{capacity}";
          format-warning = "[󱐋 󱐋 󱐋]{capacity}";
          format-critical = "[ 󱐋 󱐋 ]{capacity}";
          tooltip-format = "PD: {power}W\n{timeTo}";
        };

        bluetooth = {
          format-on = "<span font_size='145%' rise='-2304'></span>";
          format-off = "<span font_size='145%' rise='-2304'>󰂲</span>";
          format-connected = "<span font_size='145%' rise='-2304'>󰂱</span>";
          format-no-controller = "<span font_size='145%' rise='-2304'>󰂲</span>";
          tooltip-format = "bluetooth {status}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias}";

          on-click = "fish -c 'pidof bluetuith || kitty --class=bluetooth.kitty -e bluetuith'";
        };

        network = {
          interval = 5;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤥"
            "󰤨"
          ];
          format-wifi = "<span font_size='165%' rise='-3328'>{icon}</span>"; # "{essid}<span font_size='165%' rise='-3328'>{icon}</span>";
          format-ethernet = "<span font_size='165%' rise='-3328'>󰈀</span>"; # "{ifname}<span font_size='165%' rise='-3328'>󰈀</span>";
          format-disconnected = "<span font_size='165%' rise='-3328'>󰤭</span>";
          format-disabled = "<span font_size='165%' rise='-3328'>󰀝</span>";
          tooltip-format-wifi = "SSID: {essid}\nstr: {signalStrength}\nfreq: {frequency}GHz";
          tooltip-format-ethernet = "ifname: {ifname}";
          tooltip-format-disconnected = "disconnected";
          tooltip-format-disabled = "wifi off";

          on-click = "fish -c 'pidof wifitui || kitty --class=wifi.kitty -e wifitui'";
          on-click-right = "fish -c wifi-toggle";
        };

        clock = {
          format = "{:%a | %d.%m.%Y | %H:%M}";

          tooltip-format = "<tt><span font='12'>{calendar}</span></tt>";

          calendar = {
            mode = "month";
            format = {
              today = "<span color='#94e2d5'><b><u>{}</u></b></span>";
              days = "<span color='#cdd6f4'>{}</span>";
              weekdays = "<span color='#89dceb'><b>{}</b></span>";
              months = "<span color='#74c7ec'><b>{}</b></span>";
            };
          };

          on-click = "fish -c 'pidof tty-clock && pkill tty-clock|| kitty --class=clock.kitty -e tty-clock tty-clock -c -s -f \"%a %e-%b-%Y\"'";
        };
      };
    };
  };
}
