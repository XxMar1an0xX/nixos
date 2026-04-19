{
  inputs,
  self,
  ...
}: {
  flake.nixOnDroidConfigurations.default =
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
    };
}
