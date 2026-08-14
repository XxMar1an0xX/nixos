{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.laptopTweaks = {
    config,
    lib,
    EsPortable,
    ...
  }: {
    boot.loader.grub = {
      gfxmodeEfi = lib.mkForce "1920x1080";
      gfxmodeBios = lib.mkForce "1980x1020";
    };
  };
}
