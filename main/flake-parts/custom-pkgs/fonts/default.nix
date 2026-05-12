{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.hashtag = pkgs.stdenvNoCC.mkDerivation rec {
      pname = "Hashtag-Font";
      version = "1.0";
      dontConfigure = true;
      nativeBuildInputs = [pkgs.unzip];
      buildInputs = [pkgs.unzip];
      dontUnpack = false;
      src = pkgs.fetchurl {
        url = "https://dl.dafont.com/dl/?f=hashtag";
        sha256 = "sha256-7TjaqvYpn4N4zF7lVwc7dKCUZHLeAU7pGqGu1d47xHM=";
      };
      sourceRoot = ".";

      unpackPhase = ''
        unzip $src
      '';
      installPhase =
        /*
        bash
        */
        ''
          mkdir -p $out/share/fonts/truetype
          cp *.ttf $out/share/fonts/truetype/ #ttf para hastag/ammys TTF para journal/jp-hand
        '';
    };
  };
}
