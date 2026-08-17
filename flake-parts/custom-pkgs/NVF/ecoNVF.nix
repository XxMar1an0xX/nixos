{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages.ecoNVF =
      (inputs.nvf.lib.neovimConfiguration {
        modules = [
          {_class = "nvf";}
          self.modules.nvf.funcionalidad
          self.modules.nvf.nix
          self.modules.nvf.rust
          self.modules.nvf.arduino
          self.modules.nvf.lspFeatures
          {
          }
        ];
        pkgs = inputs'.nixpkgs-droid.legacyPackages;
      }).neovim;
  };
}
