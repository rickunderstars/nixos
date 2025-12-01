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
        source = ../../assets/fastfetch/frieren-cat.png;
        padding = {
          left = 0;
          right = 3;
          top = 0;
        };
      };
      display = {
        separator = "";
        key.width = 15;
        color = {
          output = "italic_bold_#cdd6f4";
        };
      };
    };
  };
}
