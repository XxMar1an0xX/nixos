{
  self,
  inputs,
  ...
}: {
  flake.homeModules.syncthing = {isLaptop ? false, ...}: {
    services.syncthing = {
      enable = true;
      tray.enable = true;

      # openDefaultPorts = true;
      settings = {
        devices =
          if isLaptop
          then {
            "Celular" = {
              id = "UGTUHXQ-4SWDD2D-FTKWYN5-WFDGFPX-CWKPP74-W5RY7MP-CXRNGA6-6ASH6QK";
            };
            "nixos" = {
              id = "G2HS2PO-L2ZVSWA-JFWX5CG-JILDBS2-SX3CD5J-DVT3YP4-4WLGW2Y-XK6WLA3";
            };
          }
          else {
            "Celular" = {
              id = "UGTUHXQ-4SWDD2D-FTKWYN5-WFDGFPX-CWKPP74-W5RY7MP-CXRNGA6-6ASH6QK";
            };
            "laptop" = {
              id = "VM7KRWT-B7Q22XH-7L6CY7U-SW6XLLO-XQBTBQS-OHRSFAK-OLZZTPO-CF4TTAV";
            };
          };
        folders = {
          "Syncron" = {
            path = "/home/ruiz/Documentos/Syncron";
            devices =
              ["Celular"]
              ++ (
                if isLaptop
                then ["nixos"]
                else ["laptop"]
              );
          };
          "Musica" = {
            path = "/home/ruiz/Musica/";
            devices =
              ["Celular"]
              ++ (
                if isLaptop
                then ["nixos"]
                else ["laptop"]
              );
          };
          "Phone Backup" = {
            path = "/home/ruiz/DataBackup/";
            devices =
              ["Celular"]
              ++ (
                if isLaptop
                then ["nixos"]
                else ["laptop"]
              );
          };
        };
        # options = {
        #   urAccepted = "-1";
        # };
      };
    };
  };
}
