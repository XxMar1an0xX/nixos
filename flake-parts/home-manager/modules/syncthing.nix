{
  self,
  inputs,
  ...
}: {
  flake.homeModules.syncthing = {
    services.syncthing = {
      enable = true;
      tray.enable = true;
      # openDefaultPorts = true;
      settings = {
        devices = {
          "Celular" = {
            id = "UGTUHXQ-4SWDD2D-FTKWYN5-WFDGFPX-CWKPP74-W5RY7MP-CXRNGA6-6ASH6QK";
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
  };
}
