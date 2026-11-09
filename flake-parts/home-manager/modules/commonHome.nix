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
      (pkgs.rustPlatform.buildRustPackage {
        pname = "termflux";
        version = "0.2.0";

        src = pkgs.fetchFromGitHub {
          owner = "tndoan";
          repo = "termflux";
          rev = "v0.2.0";
          hash = "sha256-2LLLLSpLfSatw2HzMutInlGFHU3K/WW644ss/+zlMvg=";
        };

        cargoHash = "sha256-ASS47ZXMw4FMFbxcqS9VIXQ2Y4niEK/DRCmg1qWbgTY=";
      })
      inputs.unimatrix.packages.${pkgs.stdenv.hostPlatform.system}.unimatrix
      pkgs.freerdp
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
      ".config/termflux/config.toml".text =
        /*
        toml
        */
        ''
          # Animation: starfield, matrix, fire, external, none
          
          animation = "external"
          external_command = "unimatrix -s 97 -a -o -i -l kgnnr -c blue"


          # Animation opacity (0.0 - 1.0)
          opacity = 0.3

          # Frames per second
          # fps = 60

          # Background color
          # background = "#1a1b26"

          # Disable animation in Vim, htop, etc.
          disable_animation_alt_screen = true
        '';
    };
    programs.wofi = {
      enable = true;
      settings = {
        # monitor = "DP-1";
        show = "drun";
        columns = 2;
        width = "35%";
        no_actions = true;
        allow_images = true;
        insensitive = true;
        image_size = 40;
        prompt = "   Search...";
      };
      style = builtins.readFile ./../../../recursos/wofi.css;
    };
  };
}
