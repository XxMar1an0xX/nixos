{...}: {
  flake.homeModules.syncthing = {isLaptop ? false, ...}: {
    services.syncthing = {
      enable = true;
      tray.enable = true;

      settings = {
        devices =
          if isLaptop
          then {
            "Armor 24" = {
              id = "D67WJL4-YRDZZL2-IONQJ6F-AO36USF-FCRY2QK-PH5E7LC-YA7WWK4-S2Z7ZQC";
            };
            "nixos" = {
              id = "G2HS2PO-L2ZVSWA-JFWX5CG-JILDBS2-SX3CD5J-DVT3YP4-4WLGW2Y-XK6WLA3";
            };
          }
          else {
            "Armor 24" = {
              id = "D67WJL4-YRDZZL2-IONQJ6F-AO36USF-FCRY2QK-PH5E7LC-YA7WWK4-S2Z7ZQC";
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
