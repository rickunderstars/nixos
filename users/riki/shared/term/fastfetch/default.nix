{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

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
          format = "{##f5e0dc}╭┤{#}{user-name-colored}{##f5e0dc}{#}{host-name-colored}{##f5e0dc}├─────────────────────── ─── ─ ──  ─ ─╮{#}";
        }
        {
          type = "custom";
          format = "{##f5e0dc}│{#}";
        }
        {
          type = "os";
          key = "│ os  ";
          keyColor = "italic_#f5e0dc";
        }
        {
          type = "host";
          key = "│ host  ";
          format = "{vendor} {family}";
          keyColor = "italic_#f2cdcd";
        }
        {
          type = "kernel";
          key = "│ kernel  ";
          keyColor = "italic_#f5c2e7";
        }
        {
          type = "bootmgr";
          key = "│ boot  ";
          format = "{firmware-name}";
          keyColor = "italic_#cba6f7";
        }
        {
          type = "uptime";
          key = "│ uptime  ";
          keyColor = "italic_#f38ba8";
        }
        {
          type = "custom";
          key = "├──────────────────────────────── ─  ── ─ ─  ─";
          keyColor = "#f38ba8";
        }
        {
          type = "shell";
          key = "│ shell  ";
          keyColor = "italic_#eba0ac";
        }
        {
          type = "terminal";
          key = "│ term  ";
          keyColor = "italic_#fab387";
        }
        {
          type = "packages";
          key = "│ pkgs  ";
          keyColor = "italic_#f9e2af";
        }
        {
          type = "wm";
          key = "│ wm  ";
          keyColor = "italic_#a6e3a1";
        }
        {
          type = "custom";
          key = "├────────────────────────── ─ ──── ── ─ ─  ─";
          keyColor = "#a6e3a1";
        }
        {
          type = "cpu";
          key = "│ cpu  ";
          format = "{name}";
          keyColor = "italic_#94e2d5";
        }
        {
          type = "gpu";
          key = "│ gpu  ";
          format = "{name}";
          keyColor = "italic_#89dceb";
        }
        {
          type = "memory";
          key = "│ memory  ";
          keyColor = "italic_#74c7ec";
        }
        {
          type = "disk";
          key = "│ ssd  ";
          format = "{size-used} / {size-total} ({size-percentage})";
          keyColor = "italic_#89b4fa";
        }
        {
          type = "display";
          key = "│ display  ";
          format = "{width}x{height} @ {refresh-rate}Hz ({type}) ";
          keyColor = "italic_#b4befe";
        }
        {
          type = "custom";
          key = "╰─────────────────────────── ── ─   ─ ─  ── ─ ── ╯";
          keyColor = "#b4befe";
        }
      ];
    };
  };
}
