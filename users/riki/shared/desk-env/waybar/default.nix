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
    style = ../../../assets/waybar/style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
        ];
        modules-right = [
          "tray"
          "cava"
          "wireplumber"
          "backlight"
          "idle_inhibitor"
          "memory"
          "cpu"
          "battery"
          "bluetooth"
          "network"
          "hyprland/language"
          "clock"
        ];
        mode = "dock";
        reload_style_on_change = true;

        "hyprland/language" = {
          format = "{}";
          format-it = "IT";
          format-en = "EN";
        };

        "hyprland/workspaces" = {
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
          on-scroll-up = "hyprctl dispatch workspace m+1";
          on-scroll-down = "hyprctl dispatch workspace m-1";
        };

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
          format-no-controller = "<span font_size='145%' rise='-2304'>󰂲</span>";
          tooltip-format = "bluetooth {status}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias}";

          on-click = "fish -c 'pidof bluetuith || ghostty --class=ghostty.bluetooth -e bluetuith'";
        };

        memory = {
          interval = 10;
          format = "<span font_size='150%' rise='-2560'></span>{percentage}";
          on-click = "fish -c 'pidof btop || ghostty --class=ghostty.btop -e btop'";
        };

        cpu = {
          interval = 2;
          format = "<span font_size='150%' rise='-2560'> </span>{usage}";
          on-click = "fish -c 'pidof btop || ghostty --class=ghostty.btop -e btop'";
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
          framerate = 120;
          hide_on_silence = false;
          bar_delimiter = 0;
        };

        tray = {
          show-passive-items = true;
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
          format-wifi = "<span font_size='165%' rise='-3328'>{icon}</span>"; # "{essid}<span font_size='165%' rise='-3328'>{icon}</span>";
          format-ethernet = "<span font_size='165%' rise='-3328'>󰈀</span>"; # "{ifname}<span font_size='165%' rise='-3328'>󰈀</span>";
          format-disconnected = "<span font_size='165%' rise='-3328'>󰤭</span>";
          format-disabled = "<span font_size='165%' rise='-3328'>󰀝</span>";
          tooltip-format-wifi = "SSID: {essid}\nstr: {signalStrength}\nfreq: {frequency}GHz";
          tooltip-format-ethernet = "ifname: {ifname}";
          tooltip-format-disconnected = "disconnected";
          tooltip-format-disabled = "wifi/ethernet off";

          on-click = "fish -c 'pidof impala || ghostty --class=ghostty.wifi -e impala'";
          on-click-right = "fish -c wifi-toggle";
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
          on-click-right = "fish -c 'pidof wiremix || ghostty --class=ghostty.wiremix -e wiremix'";
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
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "brightness: {percent}";
          reverse-scrolling = true;
        };

      };

    };
  };

  systemd.user.services = {
    waybar-restart = {
      Unit = {
        Description = "waybar auto-restart";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.waybar}/bin/waybar";
        Restart = "always";
        RestartSec = "2";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
