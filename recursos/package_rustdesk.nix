{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  wrapGAppsHook3,
  makeWrapper,
  desktop-file-utils,
  alsa-lib,
  atk,
  cairo,
  dbus,
  gdk-pixbuf,
  glib,
  gtk3,
  pango,
  libepoxy,
  libGL,
  libx11,
  libxfixes,
  libxtst,
  libxcb,
  libxkbcommon,
  wayland,
  libpulseaudio,
  gst_all_1,
  pam,
  zlib,
  libayatana-appindicator,
  libva,
  libvdpau,
  pipewire,
  systemd,
  fuse3,
  xdotool,
  xrandr,
  xdg-utils,
  xdg-user-dirs,
  coreutils,
  procps,
  gnugrep,
  gawk,
  gnused,
  util-linux,
  which,
  curl,
  bash,
  addDriverRunpath
}:
let
  version = "1.4.9";
  sources = {
    x86_64-linux = {
      arch = "x86_64";
      hash = "sha256-ckS6R8QOgEFyBEv75llGfFTORlVMmOeMjAQG8dYS/aM=";
    };
    aarch64-linux = {
      arch = "aarch64";
      hash = "sha256-zmLJlvFNM/O746Mw6VNkSkS6zn8FiFp5U/c5XWn7ScA=";
    };
  };
  source = sources.${stdenv.hostPlatform.system}
    or (throw "rustdesk-bin supports only x86_64-linux and aarch64-linux");
  # These libraries are loaded with dlopen and are invisible to DT_NEEDED.
  dynamicLibraries = [
    alsa-lib
    libayatana-appindicator
    libGL
    libva
    libvdpau
    pipewire
    systemd
    fuse3
    xdotool
  ];
  commandPackages = [
    bash coreutils procps gnugrep gawk gnused util-linux which curl
    systemd xdotool xrandr xdg-utils xdg-user-dirs
  ];
in
stdenv.mkDerivation {
  pname = "rustdesk-bin";
  inherit version;

  src = fetchurl {
    url = "https://github.com/rustdesk/rustdesk/releases/download/${version}/rustdesk-${version}-${source.arch}.deb";
    inherit (source) hash;
  };

  strictDeps = true;
  nativeBuildInputs = [
    dpkg autoPatchelfHook wrapGAppsHook3 makeWrapper desktop-file-utils
  ];
  buildInputs = [
    stdenv.cc.cc.lib
    atk cairo dbus gdk-pixbuf glib gtk3 pango libepoxy
    libx11 libxfixes libxtst libxcb libxkbcommon wayland
    libpulseaudio pam zlib
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
  ] ++ dynamicLibraries;
  # The service can re-exec the real ELF via sudo, which clears LD_LIBRARY_PATH.
  runtimeDependencies = map lib.getLib dynamicLibraries;
  appendRunpaths = [ "${addDriverRunpath.driverLink}/lib" ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb --extract "$src" source
    runHook postUnpack
  '';

  dontConfigure = true;
  dontBuild = true;
  # Preserve Flutter's prebuilt code and its executable/data/lib layout.
  dontStrip = true;
  dontWrapGApps = true;

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/bin" "$out/lib" "$out/share"
    cp -a source/usr/share/rustdesk "$out/lib/rustdesk"
    cp -a source/usr/share/applications "$out/share/"
    cp -a source/usr/share/icons "$out/share/"

    # Debian's service and install helpers are replaced by the NixOS module.
    rm -r "$out/lib/rustdesk/files"
    for desktop in "$out"/share/applications/*.desktop; do
      substituteInPlace "$desktop" \
        --replace-fail 'Exec=rustdesk' "Exec=$out/bin/rustdesk"
      desktop-file-validate "$desktop"
    done
    runHook postInstall
  '';

  preFixup = ''
    addAutoPatchelfSearchPath "$out/lib/rustdesk/lib"
    makeWrapper "$out/lib/rustdesk/rustdesk" "$out/bin/rustdesk" \
      "''${gappsWrapperArgs[@]}" \
      --prefix PATH : ${lib.makeBinPath commandPackages} \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath dynamicLibraries}:${addDriverRunpath.driverLink}/lib" \
      --prefix GST_PLUGIN_SYSTEM_PATH_1_0 : "${lib.getLib pipewire}/lib/gstreamer-1.0"
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck
    export HOME="$TMPDIR/home"
    mkdir -p "$HOME"
    # Exercise the wrapper, dynamic loader and Rust FFI without a display.
    actualVersion=$("$out/bin/rustdesk" --version)
    test "$actualVersion" = "${version}"
    test -s "$out/lib/rustdesk/data/icudtl.dat"
    test -s "$out/lib/rustdesk/data/flutter_assets/AssetManifest.bin"
    runHook postInstallCheck
  '';

  meta = {
    description = "RustDesk remote desktop client, official Flutter binaries";
    homepage = "https://rustdesk.com";
    changelog = "https://github.com/rustdesk/rustdesk/releases/tag/${version}";
    license = lib.licenses.agpl3Only;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = builtins.attrNames sources;
    mainProgram = "rustdesk";
  };
}
