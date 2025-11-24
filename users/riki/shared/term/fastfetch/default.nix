{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  logo-src = ../../../assets/fastfetch/frieren-cat.png;
  custom-separator = {
    type = "custom";
    key = "*";
  };
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = logo-src;
        height = 19;
        padding = {
          left = 0;
          right = 3;
          top = 0;
        };
      };
      display.separator = "";
      display.key.width = 15;
      modules = [
        {
          type = "title";
          format = "  {user-name-colored}{at-symbol-colored}{host-name-colored}  ";
        }
        custom-separator
        {
          type = "os";
          key = "  os  ";
          keyColor = "italic_green";
        }
        {
          type = "host";
          key = "  host  ";
          format = "{vendor} {family}";
          keyColor = "italic_green";
        }
        {
          type = "kernel";
          key = "  kernel  ";
          keyColor = "italic_green";
        }
        {
          type = "bootmgr";
          key = "  boot  ";
          format = "{firmware-name}";
          keyColor = "italic_green";
        }
        {
          type = "uptime";
          key = "  uptime  ";
          keyColor = "italic_green";
        }
        custom-separator
        {
          type = "shell";
          key = "  shell  ";
          keyColor = "italic_cyan";
        }
        {
          type = "terminal";
          key = "  term  ";
          keyColor = "italic_cyan";
        }
        {
          type = "packages";
          key = "  pkgs  ";
          keyColor = "italic_cyan";
        }
        {
          type = "wm";
          key = "  wm  ";
          keyColor = "italic_cyan";
        }
        custom-separator
        {
          type = "cpu";
          key = "  cpu  ";
          format = "{name}";
          keyColor = "italic_blue";
        }
        {
          type = "gpu";
          key = "  gpu  ";
          format = "{name}";
          keyColor = "italic_blue";
        }
        {
          type = "memory";
          key = "  memory  ";
          keyColor = "italic_blue";
        }
        {
          type = "disk";
          key = "  ssd  ";
          format = "{size-used} / {size-total} ({size-percentage})";
          keyColor = "italic_blue";
        }
        {
          type = "display";
          key = "  display  ";
          format = "{width}x{height} @ {refresh-rate}Hz ({type}) ";
          keyColor = "italic_blue";
        }
        custom-separator
      ];
    };
  };
}
