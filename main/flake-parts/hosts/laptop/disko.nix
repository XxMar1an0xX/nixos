{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.diskolaptop = {...}: {
    modules = [inputs.disko.nixosModules.disko];
    disko.devices.disk.main = {
      type = "disk";
      #NOTE: esto es MUY sensitivo a cualquier cambio en el disco, cambiar con cuidado
      device = "/dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B7783E429CA";

      content = {
        type = "gpt";

        partitions = {
          boot = {
            size = "1G";
            type = "EF00";

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

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
