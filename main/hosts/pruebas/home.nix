{
  inputs,
  pkgs,
  stylix,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
  ];
  home.username = "ruiz";
  home.homeDirectory = "/home/ruiz/";
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  home.stateVersion = "24.05"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
  ];
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.nh = {
    enable = true;
    flake = github:XxMar1an0xX/nixos?dir=main;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
