{
  description = "Flake principal de configuracion Nix general";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixai.url = "github:olafkfreund/nix-ai-help";

    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixai,
    nixpkgs,
    stylix,
    nix-on-droid,
    home-manager,
    nvf,
    self,
    ...
  } @ inputs: let
    usuario = "ruiz";
  in {
    # formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit usuario;
        };
        modules = [
          ./hosts/principal/configuration.nix
          inputs.home-manager.nixosModules.default
          stylix.nixosModules.stylix
          nixai.nixosModules.default
          inputs.minegrub-world-sel-theme.nixosModules.default
          inputs.minegrub-theme.nixosModules.default

          nvf.nixosModules.default
          # {
          #   services.nixai = {
          #     enable = true;
          #     mcp.enable = true;
          #   };
          # }
        ];
      };
      portable = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/portable/portable-configuration.nix
          inputs.home-manager.nixosModules.default
          stylix.nixosModules.stylix
          inputs.minegrub-world-sel-theme.nixosModules.default
          nvf.nixosModules.default
        ];
      };

      pruebas = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/pruebas/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [
        ./hosts/nix-on-droid/nix-on-droid.nix

        # list of extra modules for Nix-on-Droid system
        # { nix.registry.nixpkgs.flake = nixpkgs; }
        # ./path/to/module.nix

        # or import source out-of-tree modules like:
        # flake.nixOnDroidModules.module
      ];

      # list of extra special args for Nix-on-Droid modules
      extraSpecialArgs = {
        # rootPath = ./.;
        inherit inputs;
      };

      # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
      pkgs = import nixpkgs {
        system = "aarch64-linux";

        overlays = [
          nix-on-droid.overlays.default
          # add other overlays
        ];
      };

      # set path to home-manager flake
      home-manager-path = home-manager.outPath;
    };
  };
}
