{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.ammys = pkgs.stdenv.mkDerivation rec {
      #NOTE: add to home manager packages
      pname = "ammys-handwriting-Font";
      version = "1.0";
      dontConfigure = true;
      nativeBuildInputs = with pkgs; [
        unzip
      ];
      buildInputs = [pkgs.unzip];
      dontUnpack = false;
      src = pkgs.fetchurl {
        url = "https://dl.dafont.com/dl/?f=ammys_handwriting";
        sha256 = "sha256-a/fR9SqY/20vTDg2ehZrWM3BseotFGNYa6AjJxELy4g=";
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
          mv *.ttf $out/share/fonts/truetype/
        '';
    };
  };
}
