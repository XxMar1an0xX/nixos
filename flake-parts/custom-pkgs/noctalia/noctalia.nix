{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = (lib.builtins.fromJSON (lib.builtins.readFile ./../../../recursos/noctalia.json)).settings;
    };
  };
}
