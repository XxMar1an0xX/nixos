{
  inputs,
  self,
  ...
}: {
  flake.nixOnDroidConfigurations.default = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
    modules = [
      self.nixOndroidModules.configprincipal
      # stylix.nixOnDroidModules.stylix
      (
        {pkgs, ...}: {
          # nixpkgs.overlays = [
          #   rust-overlay.overlays.default
          # ];
          environment.packages = [
            self.packages."aarch64-linux".ecoNVF
            # self.packages.aarch64-linux.arduino-cli
            # pkgs.rust-bin.stable.latest.default
          ];
        }
      )
      # list of extra modules for Nix-on-Droid system
      # { nix.registry.nixpkgs.flake = nixpkgs; }
      # ./path/to/module.nix
      #kdksks

      # or import source out-of-tree modules like:
      # flake.nixOnDroidModules.module
    ];

    # list of extra special args for Nix-on-Droid modules
    extraSpecialArgs = {
      # inherit rust-overlay;
      # rootPath = ./.;
      # inherit nvf;
      # inherit outputs;
      # inherit inputs;
    };

    # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
    pkgs = import inputs.nixpkgs-droid {
      system = "aarch64-linux";

      overlays = [
        inputs.nix-on-droid.overlays.default

        # rust-overlay.overlays.default
        # add other overlays
      ];
    };

    # set path to home-manager flake
    home-manager-path = inputs.home-manager.outPath;
  };
}
