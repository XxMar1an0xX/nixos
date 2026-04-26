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
    packages.test = inputs'.nixpkgs-droid.legacyPackages.neovim;
  };
}
