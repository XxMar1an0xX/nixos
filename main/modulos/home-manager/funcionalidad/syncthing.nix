{...}: {
  services.syncthing = {
    enable = true;
    tray.enable = true;
    # openDefaultPorts = true;
    settings = {
      devices = {
        "Celular" = {
          id = "QE6WMCH-YQVUKT7-T2RBXPQ-ASJXIY5-J65NCR2-2SEQTIW-P6LRFDX-TRLJIQN";
        };
      };
      folders = {
        "Syncron" = {
          path = "/home/ruiz/Documentos/Syncron";
          devices = ["Celular"];
        };
        "Musica" = {
          path = "/home/ruiz/Musica/";
          devices = ["Celular"];
        };
        "Phone Backup" = {
          path = "/home/ruiz/DataBackup/";
          devices = ["Celular"];
        };
      };
      # options = {
      #   urAccepted = "-1";
      # };
    };
  };
}
