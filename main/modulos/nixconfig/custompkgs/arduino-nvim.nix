{
  # lib,
  pkgs,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "Arduino-nvim";
  buildInputs = with pkgs; [
    arduino-cli
    clang
    arduino-language-server
    lua
  ];
  src = ./../../../recursos/Arduino-Nvim;
}
