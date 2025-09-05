{
  lib,
  buildNeovimPlugin,
  pkgs,
}:
buildNeovimPlugin {
  pname = "arduino.nvim";
  version = "1.0";

  dontConfigure = true;
  src = pkgs.fetchFromGitHub {
    owner = "yuukiflow";
    repo = "Arduino-Nvim";
    rev = "8d1dff82d1c2a248155c9234bddb2c9a82d07a25";
    hash = "";
  };
}
