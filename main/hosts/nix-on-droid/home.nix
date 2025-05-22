{
  config,
  lib,
  pkgs,
  ...
}: {
  # Read the changelog before changing this value
  home.stateVersion = "24.05";

  imports = [
    ./../../elnixvim/nixvim.nix
  ];

  # insert home-manager config
}
