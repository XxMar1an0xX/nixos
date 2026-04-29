{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.NVF =
      (inputs.nvf.lib.neovimConfiguration {
        modules = [
          {_class = "nvf";}
          # {_module.args = {inherit self';};}
          self.modules.nvf.funcionalidad
          self.modules.nvf.theme
          self.modules.nvf.rust
          self.modules.nvf.nix
          self.modules.nvf.lspFeatures
          self.modules.nvf.extraLangs
          self.modules.nvf.arduino

          # {
          #   _module.args = let
          #     hola = "${self.packages.aarch64-linux.arduino-cli}";
          #   in {
          #     inherit hola;
          #   };
          # }
        ];
        inherit pkgs;
      }).neovim;
  };
}
