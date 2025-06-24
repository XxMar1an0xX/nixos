{
  lib,
  pgks,
  modulesPath,
  ...
}:
lib.mkIf custom.HacerPortable {
  modules = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];
  # mkIf = custom.HacerPortable
  #teclado generico
  services.xserver.xkb = lib.mkForce {
    layout = "latam";
    variant = "";
    model = "";
  };

  #NOTE: quitar anti modo suspender
  systemd.targets.sleep.enable = lib.mkForce true;
  systemd.targets.suspend.enable = lib.mkForce true;
  systemd.targets.hibernate.enable = lib.mkForce true;
  systemd.targets.hybrid-sleep.enable = lib.mkForce true;

  #NOTE: grub
  boot.loader.grub = lib.mkForce {
    gfxmodeEfi = "";
    gfxmodeBios = "";
  };
}
