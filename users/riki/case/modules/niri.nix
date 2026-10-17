{ ... }:

{
  wayland.windowManager.niri.settings = {
    _children = [
      {
        output = {
          _args = [ "DP-2" ];
          mode = "1920x1080@144.001";
          position._props = {
            x = 0;
            y = 0;
          };
          focus-at-startup = { };
          hot-corners.off = { };
        };
      }
      {
        output = {
          _args = [ "HDMI-A-1" ];
          mode = "1920x1080@74.973";
          position._props = {
            x = -1920;
            y = 0;
          };
          hot-corners.off = { };
        };
      }
    ];
  };
}
