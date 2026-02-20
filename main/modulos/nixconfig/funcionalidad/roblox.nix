{pkgs, ...}: {
  #NOTE: roblox

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
    update = {
      #NOTE: en caso de querer actualizar flatpak en cada rebuild
      # onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
    };
  };
}
