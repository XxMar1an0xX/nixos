{
  self,
  inputs,
  ...
}: {
  flake.perSystem.packages.NVF =
    (inputs.nvf.lib.neovimConfiguration {
      modules = [
        {_module.class = "nvf";}
        self.modules.nvf.baseConfig
        # {
        #   _module.args = let
        #     hola = "${self.packages.aarch64-linux.arduino-cli}";
        #   in {
        #     inherit hola;
        #   };
        # }
      ];
      pkgs = import inputs.nixpkgs;
    }).neovim;
}
