{
  self,
  inputs,
  ...
}: {
  flake.homeModules.winapps = {lib, ...}: {
    home.file = {
      ".config/winapps/winapps.conf".source = ./../../../recursos/winapps.conf;
      ".config/winapps/compose.yaml".source = ./../../../recursos/compose.yaml;
    };
  };
}
