{
  pkgs,
  inputs,
  # nvf,
  ...
}: {
  # Read the changelog before changing this value
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    mp3gain
    unzip
  ];

  imports = [
    ./../../modulos/home-manager/fastfetch.nix
    # ./test.nix
    # ./../../modulos/home-manager/terminal.nix

    ./../../modulos/home-manager/config-cortas.nix
    ./../../modulos/home-manager/stylix-hm.nix
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts.emoji = pkgs.nerd-fonts.symbols-only;
  };

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.gh = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
  };
  programs.git = {
    enable = true;
  };
  programs.home-manager.enable = true;
  # insert home-manager config
}
