{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./programas_esenciales.nix
    ./invidious.nix
    ./limpieza_y_actualizacion.nix
    ./usuario_portable.nix
  ];
}
