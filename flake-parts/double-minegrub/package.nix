{ lib, stdenvNoCC, fetchurl, grub2, mainMenuTimeout ? 10 }:
stdenvNoCC.mkDerivation {
  pname = "double-minegrub-theme";
  version = "2026-09-14";

  src = fetchurl {
    url = "https://api.github.com/repos/Lxtharia/minegrub-theme/tarball/89f9e24f44cbe06b11d69068e39f534666e4d3d3";
    name = "minegrub-theme.tar.gz";
    sha256 = "709b1e4d5c84101274f8f5150f6b253c88b02af3be8f2b8bf9b65a5956e1aee6";
  };
  worldSource = fetchurl {
    url = "https://api.github.com/repos/Lxtharia/minegrub-world-sel-theme/tarball/29bfe180a086454e8cd7a690ed0a0d0ed10446c1";
    name = "minegrub-world-sel-theme.tar.gz";
    sha256 = "09bd56525e58b6f585c1b6092bef87739b14db0084b09354d1a16d539fe92d39";
  };

  nativeBuildInputs = [ grub2 ];
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    runHook preInstall
    mkdir -p world "$out/main"
    tar -xzf "$worldSource" --strip-components=1 -C world
    cp -r world/minegrub-world-selection/. "$out/"
    cp minegrub/*.png minegrub/*.pf2 minegrub/theme.txt "$out/main/"
    # Three working buttons; remove the upstream example's hard-coded count.
    substituteInPlace "$out/main/theme.txt" \
      --replace-fail 'top = 40%+314' 'top = 40%+242' \
      --replace-fail '647 Packages Installed' 'NixOS'
    cp ${./mainmenu.cfg} "$out/mainmenu.cfg"
    substituteInPlace "$out/mainmenu.cfg" \
      --replace-fail '@timeout@' '${toString mainMenuTimeout}'
    mkdir -p "$out/licenses"
    cp LICENSE "$out/licenses/minegrub.txt"
    cp world/LICENSE "$out/licenses/world-selection.txt"
    runHook postInstall
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck
    grub-script-check "$out/mainmenu.cfg"
    test -s "$out/theme.txt"
    test -s "$out/background.png"
    test -s "$out/main/theme.txt"
    test -s "$out/main/background.png"
    test -s "$out/main/Minecraft30.pf2"
    test -s "$out/main/Monocraft22.pf2"
    runHook postInstallCheck
  '';

  meta = {
    description = "Minecraft main menu followed by the NixOS GRUB world selection menu";
    homepage = "https://github.com/Lxtharia/double-minegrub-menu";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
