{
  self,
  inputs,
  ...
}: {
  flake.homeModules.fastfetch = {pkgs, ...}: {
    programs.fastfetch = {
      enable = true;
      package = self.packages."${pkgs.stdenv.hostPlatform.system}".fastfetch;
    };
  };
}
