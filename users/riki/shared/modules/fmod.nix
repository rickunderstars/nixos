{
  appimageTools,
  requireFile,
  ...
}:

let
  pname = "fmod-studio";
  version = "2.04.00"; # !! remember to change version when updating

  src = requireFile {
    name = "fmod-studio-${version}.AppImage"; # change filename downloaded to this
    # calculate hash this way:
    #   nix hash file --type sha256 --sri ./fmod-studio-2.04.00.AppImage
    hash = "sha256-K0OnEngm/XkbuE4BBAKO11poLNwLT8pGUkjEQ/K+u1E=";
    message = ''
      FMOD requires login.
      Download FMOD appimage and:

        nix store add-file ./fmod-studio-${version}.AppImage
    '';
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs =
    pkgs: with pkgs; [
      zstd
      zlib
      expat
      openssl
      libatomic_ops
      krb5
      glib
      dbus
      alsa-lib
      fontconfig
      freetype

      libGL
      libdrm
      libgbm
      libxkbcommon
      wayland

      nss
      nspr

      libx11
      libxau
      libxext
      libxfixes
      libxi
      libxrender
      libxrandr
      libxcomposite
      libxdamage
      libxtst
      libxshmfence
      libxkbfile
      libxcb-wm
      libxcb-keysyms
    ];

  # .desktop and icon
  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/*.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/*.png -t $out/share/pixmaps


    substituteInPlace $out/share/applications/*.desktop \
      --replace-fail 'Exec=fmodstudio' 'Exec=${pname}'
  '';
}
