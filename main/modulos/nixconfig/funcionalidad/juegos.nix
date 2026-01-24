{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  environment.systemPackages = with pkgs; [
    # mangohud
    protonup

    #NOTE: rocket league
    heroic

    #NOTE: minecraft
    prismlauncher
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ruiz/.steam/steam/compatibilitytools.d/LegacyRuntime/compatibilitytool.vdf";
  };
}
