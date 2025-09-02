{
  config,
  lib,
  CondicionalPortable,
  EsPortable,
  ...
}: {
  boot.kernelParams = [
    "modules_blacklist=ntfs3"
  ];

  boot.loader = {
    #NOTE: si no aparece en el booteo descomentar
    # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = lib.mkDefault true; #NOTE: si falla algo en boot bien que es aqui
      efiSupport = true;
      device = "nodev";
      timeoutStyle = "menu";
      extraConfig = ''
      '';
      # extraEntries = ''
      # '';
      useOSProber = true;
      gfxmodeEfi = CondicionalPortable "" "1984x1020";
      gfxmodeBios = CondicionalPortable "" "1984x1020";
      minegrub-world-sel = {
        enable = true;
        customIcons = [{}];
      };
      # extraFiles = {
      #   "/grub/theme/" = "${
      #     (pkgs.fetchFromGitHub {
      #       owner = "Lxtharia";
      #       repo = "minegrub-theme";
      #       rev = "b1caebbd5ab96f6afbfcd735b58fab9b9d8cf54b";
      #       hash = "sha256-OLFbGacrRFqSoqUc+pf66eb1xd0aU/crKfpiWSpJ0fw=";
      #     })
      #   }/minegrub";
      #   "/grub/mainmenu.cfg" = "${
      #     (pkgs.fetchFromGitHub {
      #       owner = "Lxtharia";
      #       repo = "double-minegrub-menu";
      #       rev = "05502d67cac0921caaf0aeb145dddacd8726d68b";
      #       hash = "sha256-9wQvU2jwAGDzVfHn7qEAuEId8YsWpCTJbRJkbAto1Js=";
      #     })
      #   }/mainmenu.cfg";
      # };
    };
    timeout = lib.mkForce 15;
  };
  time.hardwareClockInLocalTime = true;
}
