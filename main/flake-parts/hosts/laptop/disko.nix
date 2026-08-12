{
  self,
  inputs,
  ...
}: {
  flake.diskoConfigurations.diskolaptop = {...}: {
    # imports = [inputs.disko.nixosModules.disko];
    disko.devices.disk.main = {
      type = "disk";
      #NOTE: esto es MUY sensitivo a cualquier cambio en el disco, cambiar con cuidado
      device = "/dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B7783E429CA";

      content = {
        type = "gpt";

        partitions = {
          ESP = {
            size = "1G";
            type = "EF00";
            priority = 1;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "fmask=0077"
                "dmask=0077"
              ];
            };
          };

          root = {
            size = "100%";
            priority = 2;
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
    # disko.devices = {
    #   disk = {
    #     main = {
    #       type = "disk";
    #       device = "/dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B7783E429CA";
    #       content = {
    #         type = "gpt";
    #         partitions = {
    #           boot = {
    #             size = "1M";
    #             type = "EF02"; # for grub MBR
    #           };
    #           ESP = {
    #             size = "1G";
    #             type = "EF00";
    #             content = {
    #               type = "filesystem";
    #               format = "vfat";
    #               mountpoint = "/boot";
    #               mountOptions = ["umask=0077"];
    #             };
    #           };
    #           root = {
    #             size = "100%";
    #             content = {
    #               type = "filesystem";
    #               format = "ext4";
    #               mountpoint = "/";
    #             };
    #           };
    #         };
    #       };
    #     };
    #   };
    # };
  };
}
