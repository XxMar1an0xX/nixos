{pkgs, ...}: {
  #NOTE: roblox

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
    };
  };
}
