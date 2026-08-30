{
  self,
  inputs,
  ...
}: {
  flake.diskoConfigurations.nixos = {...}: {
    imports = [inputs.disko.nixosModules.disko];
    disko.devices.disk.main = {
      type = "disk";
      #NOTE: esto es MUY sensitivo a cualquier cambio en el disco, cambiar con cuidado
      device = "/dev/disk/by-id/nvme-ADATA_LEGEND_800_2N122LCN2JNX";

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
  };
}
