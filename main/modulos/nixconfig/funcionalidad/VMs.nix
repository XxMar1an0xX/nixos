{
  config,
  EsPortable,
  ...
}: {
  programs.virt-manager.enable = !EsPortable;
  virtualisation.libvirtd = {
    enable = !EsPortable;
  };
  virtualisation.spiceUSBRedirection.enable = !EsPortable;
  users.users.portable.extraGroups = ["libvirtd"];
}
