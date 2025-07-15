{config, ...}: let
  CondicionalPortable = Si: No: (
    if config.custom.HacerPortable
    then Si
    else No
  );
in {
  programs.virt-manager.enable = !config.custom.HacerPortable;

  virtualisation.libvirtd = {
    enable = !config.custom.HacerPortable;
  };
  virtualisation.spiceUSBRedirection.enable = !config.custom.HacerPortable;
  users.users.portable.extraGroups = ["libvirtd"];
}
