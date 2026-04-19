{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bootMenu = {
    imports = [
      inputs.minegrub-theme.nixosModules.default
      self.nixosModules.grubConfig
    ];
  };
}
