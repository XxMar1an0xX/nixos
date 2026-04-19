{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bootMenu = {
    imports = [
      self.nixosModules.grubConfig
      inputs.minegrub-world-sel-theme.nixosModules.default
    ];
  };
}
