{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "image/jpeg" = [ "imv-dir.desktop" ];
      "image/png" = [ "imv-dir.desktop" ];
      "image/gif" = [ "imv-dir.desktop" ];
      "image/bmp" = [ "imv-dir.desktop" ];
      "image/webp" = [ "imv-dir.desktop" ];
      "image/tiff" = [ "imv-dir.desktop" ];
      "image/svg+xml" = [ "imv-dir.desktop" ];
      "image/heif" = [ "imv-dir.desktop" ];
      "image/heic" = [ "imv-dir.desktop" ];
      "image/avif" = [ "imv-dir.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/wav" = [ "mpv.desktop" ];
      "audio/aac" = [ "mpv.desktop" ];
      "audio/opus" = [ "mpv.desktop" ];
      "audio/x-m4a" = [ "mpv.desktop" ];
      "audio/x-musepack" = [ "mpv.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "text/x-go" = [ "codium.desktop" ];
      "text/x-csrc" = [ "codium.desktop" ];
      "text/x-chdr" = [ "codium.desktop" ];
      "text/x-c++src" = [ "codium.desktop" ];
      "text/x-java-source" = [ "codium.desktop" ];
      "text/x-python" = [ "codium.desktop" ];
      "text/rust" = [ "codium.desktop" ];
      "text/markdown" = [ "codium.desktop" ];
      "application/json" = [ "codium.desktop" ];
      "application/yaml" = [ "codium.desktop" ];
      "application/toml" = [ "codium.desktop" ];
      "application/xml" = [ "codium.desktop" ];
      "text/x-shellscript" = [ "codium.desktop" ];
      "text/css" = [ "codium.desktop" ];
      "application/javascript" = [ "codium.desktop" ];
      "text/html" = [ "zen-twilight.desktop" ];
      "application/xhtml+xml" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/http" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/https" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/about" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-twilight.desktop" ];
      "text/x-arduino" = [ "arduino-arduinoide.desktop" ];
      "application/pdf" = [ "org.gnome.Papers.desktop" ];
      "model/stl" = [ "f3d.desktop" ];
      "model/obj" = [ "f3d.desktop" ];
      "model/ply" = [ "f3d.desktop" ];
      "application/x-blender" = [ "blender.desktop" ];
    };

    associations.added = {
      "application/pdf" = [ "zen-twilight.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "text/plain" = [ "codium.desktop" ];
      "model/stl" = [ "meshlab.desktop" ];
      "model/obj" = [ "meshlab.desktop" ];
      "model/ply" = [ "meshlab.desktop" ];
    };
  };
}
