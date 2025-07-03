{
  stdenvNoCC,
  lib,
  fetchurl,
  formats,
  pkgs,
}:
stdenvNoCC.mkDerivation rec {
  name = "celeste wallpaper";
  src = fetchurl {
    url = "https://www.desktophut.com/files/Celeste%20Summit%20Ending%20Live%20Wallpaper.m4v";
    hash = "sha256-7ATpD1x3tdTjoX33rHHjMlLwbqp46fL5eTE9mnsF1pQ=";
  };
  dontBuild = true;

  propagatedUserEnvPkgs = with pkgs; [
    ffmpeg
  ];
  installPhase = ''


  '';
}
