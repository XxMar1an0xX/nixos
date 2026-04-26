{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.test = pkgs.hello;
  };
}
