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
          # {
          #   _module.args = let
          #     hola = "${self.packages.aarch64-linux.arduino-cli}";
          #   in {
          #     inherit hola;
          #   };
          # }
          {
          }
        ];
        pkgs = inputs'.nixpkgs-droid.legacyPackages;
      }).neovim;
  };
}
