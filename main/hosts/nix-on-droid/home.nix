{
  pkgs,
  inputs,
  ...
}: {
  # Read the changelog before changing this value
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    mp3gain
    neofetch
    unzip
  ];

  imports = [
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.gh = {
    enable = true;
  };
  # programs.nh = {
  #   enable = true;
  # };
  programs.home-manager.enable = true;
  # insert home-manager config
}
