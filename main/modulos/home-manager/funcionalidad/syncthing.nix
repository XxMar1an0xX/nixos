{...}: {
  services.syncthing = {
    enable = true;
    tray.enable = true;
    # openDefaultPorts = true;
    settings = {
      devices = {
        "Celular" = {
          id = "L5OITQQ-AHJXITF-BHYMNOR-JFOP4ZT-2OPRTEQ-FC4DGVE-FFXWOSJ-6JOLTA5";
        };
      };
      folders = {
        "Syncron" = {
          path = "/home/ruiz/Documentos/Syncron";
          devices = ["Celular"];
        };
      };
      # options = {
      #   urAccepted = "-1";
      # };
    };
  };
}
