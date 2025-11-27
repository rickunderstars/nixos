{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

# top: ─
# bottom: ─
# left: │
# right: │
# top_left: ╭
# top_right: ╮
# bottom_left: ╰
# bottom_right: ╯
# middle_left: ├
# middle_right: ┤

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ../../../assets/fastfetch/frieren-cat.png;
        height = 19;
        padding = {
          left = 0;
          right = 3;
          top = 0;
        };
      };
      display = {
        separator = "";
        key.width = 15;
      };
      modules = [
        {
          type = "title";
          format = "{##cdd6f4}╭─{#} {#bold_italic_#74c7ec}{user-name}{#}{##cdd6f4}{#}{#bold_italic_#74c7ec}{host-name}{#}";
        }
        {
          type = "custom";
          format = "{##f5e0dc}│{#}";
        }

        {
          type = "custom";
          format = "{#bold_italic_#f5e0dc}├─ i{#}";
        }
        {
          type = "os";
          key = "│  ├─ os  ";
          keyColor = "italic_#f5e0dc";
        }
        {
          type = "host";
          key = "│  ├─ host  ";
          format = "{vendor} {family}";
          keyColor = "italic_#f2cdcd";
        }
        {
          type = "kernel";
          key = "│  ├─ kernel  ";
          keyColor = "italic_#f5c2e7";
        }
        {
          type = "bootmgr";
          key = "│  ├─ boot  ";
          format = "{firmware-name}";
          keyColor = "italic_#cba6f7";
        }
        {
          type = "uptime";
          key = "│  ╰─ uptime  ";
          keyColor = "italic_#f38ba8";
        }
        {
          type = "custom";
          key = "{#bold_italic_#f38ba8}├─ sw{#}";
        }
        {
          type = "shell";
          key = "│  ├─ shell  ";
          keyColor = "italic_#eba0ac";
        }
        {
          type = "terminal";
          key = "│  ├─ term  ";
          keyColor = "italic_#fab387";
        }
        {
          type = "packages";
          key = "│  ├─ pkgs  ";
          keyColor = "italic_#f9e2af";
        }
        {
          type = "wm";
          key = "│  ╰─ wm  ";
          keyColor = "italic_#a6e3a1";
        }
        {
          type = "custom";
          key = "{#bold_italic_#a6e3a1}╰─ hw{#}";
          keyColor = "#a6e3a1";
        }
        {
          type = "cpu";
          key = "   ├─ cpu  ";
          format = "{name}";
          keyColor = "italic_#94e2d5";
        }
        {
          type = "gpu";
          key = "   ├─ gpu  ";
          format = "{name}";
          keyColor = "italic_#89dceb";
        }
        {
          type = "memory";
          key = "   ├─ memory  ";
          keyColor = "italic_#74c7ec";
        }
        {
          type = "disk";
          key = "   ├─ ssd  ";
          format = "{size-used} / {size-total} ({size-percentage})";
          keyColor = "italic_#89b4fa";
        }
        {
          type = "command";
          key = "   ├─ display  ";
          keyColor = "italic_#b4befe";
          text = "hyprctl monitors -j | jq -r '.[1] | \"\\(.width)x\\(.height) @ \\(.refreshRate)Hz (\\(.name))\"'";
        }
        {
          type = "command";
          key = "   ╰─ display  ";
          keyColor = "italic_#b4befe";
          text = "hyprctl monitors -j | jq -r '.[0] | \"\\(.width)x\\(.height) @ \\(.refreshRate)Hz (\\(.name))\"'";
        }

      ];
    };
  };
}
