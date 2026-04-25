{
  self,
  inputs,
  ...
}: {
  flake.homeModules.homeDroid = {
    pkgs,
    # nvf,
    lib,
    ...
  }: {
    imports = [
      self.homeModules.fastfetch
      self.homeModules.github
      self.homeModules.aliases
      # self.homeModules.config-cortas
      # ./../../modulos/home-manager/stylix-hm.nix
    ];

    nixpkgs.overlays = [
      # inputs.rust-overlay.overlays.default
    ];
    # Read the changelog before changing this value
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      nerd-fonts.symbols-only
      mp3gain
      unzip
      # rust-bin.stable.latest.default
    ];

    fonts.fontconfig = {
      # enable = true;
      # defaultFonts.emoji = pkgs.nerd-fonts.symbols-only;
    };

    # nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    programs.zsh = {
    #  enable = true;
    };
    programs.bash = {
    enable = true;
    initExtra = "fastfetch";
    };

    programs.home-manager.enable = true;
    # insert home-manager config
    home.shellAliases = {
    };

programs.starship = {

        enable = true;
        enableBashIntegration = true;
        # settings = lib.mkForce (builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
        #     owner = "fredericrous";
        #     repo = "dotfiles";
        #     rev = "cf793fb3f87f8de1eb2e7c90a23252226d8aaf70";
        #     hash = "sha256-yr6HasmCorNsVRVeix3OM5Acqwk7K23HCvMMqyi0RT8=";
        #   }
        #   + "/private_dot_config/starship.toml")));
        # # + "/dotfiles/config/starship.toml")));
        settings = lib.mkForce (builtins.fromTOML (builtins.readFile ./../../../recursos/starship.toml));
      };
    # systemd.user.services.fastfetch = {
    #   Unit = {
    #     Description = "systemd service for automatic mounting";
    #     # after = ["network.target.service"];
    #   };
    #   Install = {
    #     WantedBy = ["multi-user.target"];
    #   https://github.com/XxMar1an0xX/nixos.git};
    #   Service = {
    #     Type = "simple";
    #     # User = "root";
    #     # Group = "root";
    #     # PermissionsStartOnly = true;
    #     ExecStart = "${pkgs.writeShellScript "ff" ''
    #       fastfetch
    #     ''}";
    #   };
    # };
  };
}
