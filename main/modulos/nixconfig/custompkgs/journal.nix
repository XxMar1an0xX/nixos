{
  lib,
  pkgs,
}:
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "Journal-Font";
  version = "1.0";
  dontConfigure = true;
  nativeBuildInputs = [pkgs.unzip];
  buildInputs = [pkgs.unzip];
  dontUnpack = false;

  #   #NOTE: obtener hash ser como:
  #   #nix hash to-sri --type sha256 $(nix-prefetch-url https://dl.dafont.com/dl/?f=hashtag)

  src = pkgs.fetchurl {
    # url = "https://dl.dafont.com/dl/?f=hashtag";
    # sha256 = "sha256-7TjaqvYpn4N4zF7lVwc7dKCUZHLeAU7pGqGu1d47xHM=";
    #Hastag/sayori

    url = "https://dl.dafont.com/dl/?f=journal";
    sha256 = "sha256-XWmL3Q+6oqnycEqx4WAU35kK5iCBmrDE7HAzj8K/f18=";
    #Journal/monika

    # url = "https://dl.dafont.com/dl/?f=jp_hand_slanted";
    # sha256 = "sha256-zVoHrgD3WaHzjTKEG5kImDn1RZC1L+78cYR0orUSfZI=";
    #jphand/yuri

    # url = "https://dl.dafont.com/dl/?f=ammys_handwriting";
    # sha256 = "sha256-a/fR9SqY/20vTDg2ehZrWM3BseotFGNYa6AjJxELy4g=";
    #ammys_handwriting/natsuki
  };

  # srcs = with pkgs; [
  #   (fetchurl {
  #     sha256 = "sha256-7TjaqvYpn4N4zF7lVwc7dKCUZHLeAU7pGqGu1d47xHM=";
  #     url = "https://dl.dafont.com/dl/?f=hashtag";
  #     name = "sayori";
  #   })
  #   (fetchurl {
  #     url = "https://dl.dafont.com/dl/?f=journal";
  #     sha256 = "sha256-XWmL3Q+6oqnycEqx4WAU35kK5iCBmrDE7HAzj8K/f18=";
  #     name = "monika";
  #   })
  #   (fetchurl {
  #     url = "https://dl.dafont.com/dl/?f=jp_hand_slanted";
  #     sha256 = "sha256-zVoHrgD3WaHzjTKEG5kImDn1RZC1L+78cYR0orUSfZI=";
  #   })
  #   (fetchurl {
  #     url = "https://dl.dafont.com/dl/?f=ammys_handwriting";
  #     sha256 = "sha256-a/fR9SqY/20vTDg2ehZrWM3BseotFGNYa6AjJxELy4g=";
  #   })
  # ];
  sourceRoot = ".";

  unpackPhase = ''
                unzip $src
                # cd src
    # unzip *.zip
    # unzip monika/*.zip
    # unzip $src3
    # unzip $src4
  '';
  buildPhase = ''
                # cd sayori
    # mkdir -p ./bufferfont
    # mv *.ttf bufferfont/
  '';
  # setsourceRoot = "sayori";

  installPhase =
    /*
    bash
    */
    ''
      mkdir -p $out/share/fonts/truetype
      cp *.TTF $out/share/fonts/truetype/ #ttf para hastag/ammys TTF para journal/jp-hand
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
