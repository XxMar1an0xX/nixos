{
  lib,
  stdenvNoCC,
  fetchFromGitLab,
  fetchzip,
}:
stdenvNoCC.mkDerivation {
  pname = "Doki-Fonts";
  version = "1.0";

  src = fetchzip {
    url = "https://dl.dafont.com/dl/?f=hashtag";
    sha256 = "";
    stripRoot = false;
  };

  installPhase = ''
    # runHook preInstall

    mkdir -p $out/share/fonts
    cp *.ttf $out/share/fonts/dokidoki/

    # runHook postInstall
  '';

  meta = with lib; {
    description = "Open Sans fonts";
    longDescription = ''
      Open Sans is a humanist sans serif typeface designed by Steve Matteson,
      Type Director of Ascender Corp.
    '';
    homepage = "https://www.opensans.com";
    license = licenses.asl20;
    platforms = platforms.all;
    teams = [teams.pantheon];
  };
}
