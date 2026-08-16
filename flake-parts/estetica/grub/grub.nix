{
  self,
  inputs,
  ...
}: let
  minegrub = inputs.minegrub-theme;
  minegrubWorld = inputs.minegrub-world;
  doubleMinegrub = inputs.double-minegrub;
in {
  flake.nixosModules.bootMenu = {
    lib,
    pkgs,
    ...
  }: let
    # embeddedConfig = pkgs.writeText "grub-embedded.cfg" ''
    #   search --file --set=root /grub/mainmenu.cfg
    #   source ($drive1)//grub/mainmenu.cfg
    # '';
    # grub-mkimage-embedded = pkgs.writeShellScriptBin "grub-mkimage" ''
    #   exec${pkgs.grub2}/bin/grub-mkimage \
    #     --config=${embeddedConfig} "$@"
    # '';
  in {
    imports = [
      # self.nixosModules.grubConfig
      # inputs.minegrub-world-sel-theme.nixosModules.default
    ];

    boot.kernelParams = [
      "modules_blacklist=ntfs3"
    ];

    boot.loader = {
      #NOTE: si no aparece en el booteo descomentar
      # systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true; #NOTE: si falla algo en boot bien que es aqui
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        timeoutStyle = "menu";
        # configFile = "/boot/grub/mainmenu.cfg";
        # theme = "/boot/grub/themes/minegrub-world-selection";
        #TODO: hacer que ande double minegrub
        # hasta donde veo reemplazar el grubx64.efi regenerandolo no va a funcionar
        # asique como alternativa se puede modificar el propio archivo de minegrub (mainmenu.cfg) para referenciar otro archivo y reemplazar grub.cfg con uno como el embedded
        extraConfig =
          /*
          bash
          */
          ''
            #NOTE: recursion infinita
            # if [theme != $prefix/themes/minegrub/theme.txt] && [hola == 0]; then
            # set hola=1
            # export hola
            # configfile ($drive1)//grub/mainmenu.cfg
            # fi

            set theme=($drive1)/grub/themes/minegrub-world-selection/theme.txt
          '';
        extraGrubInstallArgs = [
          # "--grub-mkimage=${grub-mkimage-embedded}/bin/grub-mkimage"
        ];
        extraInstallCommands =
          /*
          bash
          */
          ''
            # configfile ($drive1)//grub/mainmenu.cfg
            sudo rm -rf /boot/grub/themes
            sudo mkdir -p /boot/grub/themes
            sudo cp -ruv ${minegrubWorld}/minegrub-world-selection /boot/grub/themes/
            sudo cp -ruv ${minegrub}/minegrub /boot/grub/themes/
            sudo cp -uv ${doubleMinegrub}/mainmenu.cfg /boot/grub/
            sudo mkdir -p /etc/grub.d
            sudo cp -uv ${doubleMinegrub}/05_twomenus /etc/grub.d/
            chmod +x /etc/grub.d/05_twomenus
            #NOTE: esta mrd casi me lockea de la pc
            # sudo ${pkgs.grub2}/bin/grub-mkconfig -o /home/ruiz/grub2.cfg
            # sudo ${pkgs.grub2}/bin/grub-editenv - set config_file=mainmenu.cfg
            # rm -f /boot/EFI/NixOS-boot/grubx64.efi
          '';
        # minegrub-world-sel = {
        #   enable = true;
        #   customIcons = [{}];
        # };
      };
      timeout = lib.mkForce 15;
    };
    time.hardwareClockInLocalTime = true;
  };
}
