{
  inputs,
  stylix,
  ...
}: {
  flake = {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/principal/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.home-manager.nixosModules.default
        stylix.nixosModules.stylix
        inputs.minegrub-world-sel-theme.nixosModules.default
        inputs.minegrub-theme.nixosModules.default
        inputs.silentSDDM.nixosModules.default
      ];
    };
  };
}
