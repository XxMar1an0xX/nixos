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
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.ubuntu
    nerd-fonts.mplus
  ];

  imports = [
    ./../../elnixvim/nixvim.nix
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.nh = {
    enable = true;
  };
  programs.home-manager.enable = true;
  # insert home-manager config
}
