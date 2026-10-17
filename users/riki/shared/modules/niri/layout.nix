{ ... }:

{
  wayland.windowManager.niri.settings.layout = {
    gaps = 5;
    center-focused-column = "on-overflow";
    always-center-single-column = { };
    preset-column-widths._children = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
      { proportion = 1.0; }
    ];
    preset-window-heights._children = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
      { proportion = 1.0; }
    ];
    default-column-width.proportion = 0.5;
    focus-ring.off = { };
    border = {
      width = 2;
      active-gradient._props = {
        from = "#89b4fa";
        to = "#cba6f7";
        angle = 330;
      };
      inactive-gradient._props = {
        from = "#181825";
        to = "#313244";
        angle = 330;
      };
      urgent-color = "#fab387";
    };
    background-color = "transparent";
    insert-hint.gradient._props = {
      from = "#74c7ec";
      to = "#cba6f7";
      angle = 60;
    };
    shadow = { };
    struts = {
      left = 10;
      right = 10;
    };
  };
}
