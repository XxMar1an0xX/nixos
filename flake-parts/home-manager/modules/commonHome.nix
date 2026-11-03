{
  self,
  inputs,
  ...
}: {
  flake.homeModules.commonHome = {
    lib,
    pkgs,
    ...
  }: {
    home.username = "ruiz";
    home.homeDirectory = "/home/ruiz";
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    home.stateVersion = "24.05"; # Please read the comment before changing.

    home.packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.hashtag
      self.packages.${pkgs.stdenv.hostPlatform.system}.ammys
      self.packages.${pkgs.stdenv.hostPlatform.system}.journal
      self.packages.${pkgs.stdenv.hostPlatform.system}.jphand
      pkgs.nerd-fonts.symbols-only
    ];
    fonts.fontconfig.enable = true;
    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "librewolf";
      TERMINAL = "kitty";
    };
    programs.home-manager.enable = true;

    home.file = {
      ".config/mimeapps.list".text = ''[ Default Applications ] inode/directory= thunar/desktop '';
    };
    programs.wofi = {
      enable = true;
      settings = {
        show = "drun";
        matching = "fuzzy";
        no_actions = true;
        width = 550;
        height = 325;
        always_parse_args = true;
        show_all = true;
        print_command = true;
        layer = "overlay";
        insensitive = true;
        prompt = "Search...";
        allow_markup = true;
        allow_images = true;
      };
      style = builtins.readFile ./../../../recursos/wofi.css;
    };
  };
}
