{...}: {
  services.syncthing = {
    enable = false;
    tray.enable = true;
    settings = {
      folders = {
      };
    };
  };
}
