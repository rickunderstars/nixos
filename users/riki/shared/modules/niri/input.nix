{ ... }:

{
  wayland.windowManager.niri.settings.input = {
    disable-power-key-handling = { };
    focus-follows-mouse._props.max-scroll-amount = "33%";
    keyboard = {
      xkb = {
        layout = "us,it";
        variant = "intl,";
      };
      numlock = { };
    };
    touchpad = {
      tap = { };
      dwt = { };
      dwtp = { };
      drag = true;
      drag-lock = { };
      natural-scroll = { };
      click-method = "clickfinger";
      accel-speed = 0.0;
      accel-profile = "flat";
      scroll-method = "two-finger";
    };
    mouse = {
      accel-speed = 0.0;
      accel-profile = "flat";
    };
  };
}
