{ ... }:

{
  wayland.windowManager.niri.settings.environment = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "gtk3";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
    MICRO_TRUECOLOR = "1";
    GSK_RENDERER = "gl";
    GTK_IM_MODULE = "simple";
  };
}
