{
  lib,
  stdenvNoCC,
  pkgs,
}:
stdenvNoCC.mkDerivation {
  pname = "Nixos repo";
  version = "1.0";
  dontConfigure = true;
  nativeBuildInputs = [pkgs.unzip];
  buildInputs = [pkgs.unzip];

  src = pkgs.fetchFromGitHub {
    owner = "XxMar1an0xX";
    repo = "nixos";
    rev = "59fce391c5ffcdcba67adc1f21358c687612d71d";
    hash = "sha256-NxISwBlD21fqETaL12wNd2TMh96Baldtebtqvnuqe5U=";
  };

  installPhase =
    /*
    rust
    */
    ''
      mkdir -p $out/desarrollo/nix
      cp -r $src $out/desarrollo/nix/
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
