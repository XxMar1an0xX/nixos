{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {lib, ...}: {
    programs.noctalia = {
      enable = true;
      # settings = {};
    };
  };
}
