{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.test = pkgs.neovim;
  };
}
