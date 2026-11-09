{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {lib, ...}: {
    programs.noctalia = {
      enable = true;
      settings = lib.mkForce (lib.fromTOML (builtins.readFile ./../../../recursos/noctalia-config.toml));
      checkConfig = true;
    };
  };
}
