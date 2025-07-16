{
  lib,
  stdenvNoCC,
  pkgs,
}:
stdenvNoCC.mkDerivation {
  pname = "Doki-Fonts";
  version = "1.0";
  dontConfigure = true;

  src = pkgs.fetchFromGitHub {
    owner = "XxMar1an0xX";
    repo = "nixos";
    rev = "59fce391c5ffcdcba67adc1f21358c687612d71d";
    hash = "";
  };

  propagatedUserEnvPkgs = [pkgs.unzip];

  installPhase =
    /*
    rust
    */
    ''
      mkdir -p $out/desarrollo/nix
      cp -r  $out/desarrollo/nix/
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
