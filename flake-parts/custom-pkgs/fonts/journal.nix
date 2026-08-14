{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.journal = pkgs.stdenv.mkDerivation rec {
      #NOTE: add to home manager packages
      pname = "Journal-Font";
      version = "1.0";
      dontConfigure = true;
      nativeBuildInputs = with pkgs; [
        unzip
      ];
      buildInputs = [pkgs.unzip];
      dontUnpack = false;
      src = pkgs.fetchurl {
        url = "https://dl.dafont.com/dl/?f=journal";
        sha256 = "sha256-XWmL3Q+6oqnycEqx4WAU35kK5iCBmrDE7HAzj8K/f18=";
      };
      sourceRoot = ".";
      buildFlags = ["full-ttf"];

      unpackPhase = ''
        unzip $src
      '';
      installPhase =
        /*
        bash
        */
        ''
          # install -m444 -Dt $out/share/fonts/truetype *.ttf
          mkdir -p $out/share/fonts/truetype
          # cp -p *.ttf $out/share/fonts/truetype/ #ttf para hastag/ammys TTF para journal/jp-hand
          mv *.TTF $out/share/fonts/truetype/
        '';
    };
  };
}
