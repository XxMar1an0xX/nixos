{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.ecoNVF =
      (inputs.nvf.lib.neovimConfiguration {
        modules = [
          {_class = "nvf";}
          self.modules.nvf.funcionalidad
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
        inherit pkgs;
      }).neovim;
  };
}
