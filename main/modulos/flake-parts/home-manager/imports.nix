{
  self,
  inputs,
  ...
}: {
  flake.homeManagerModules.agregados = {
    imports = [
      (inputs.import-tree ./../../home-manager/modules)
    ];
  };
}
