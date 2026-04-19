{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.homeManager = {
    imports = [
      self.nixosModules.homeconfigPincipal
      self.homeManagerModules.fastfetch
    ];
  };
}
