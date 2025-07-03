{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Read the changelog before changing this value
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
  ];

  imports = [
    ./../../elnixvim/nixvim.nix
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  # programs.nh = {
  #   enable = true;
  # };
  programs.home-manager.enable = true;
  # insert home-manager config
}
