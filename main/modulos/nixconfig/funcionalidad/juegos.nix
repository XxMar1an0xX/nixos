{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu = {
    opencl.enable = true;
    initrd.enable = true;
    overdrive.enable = true;
  };
  services.lact.enable = true;

  # hardware.opengl.driSupport32Bit = true;
  # hardware.opengl.enable = true;
  # hardware.pulseaudio.support32Bit = true;
  environment.systemPackages = with pkgs; [
    # mangohud
    # protonup

    #NOTE: rocket league
    vulkan-tools
    heroic
    # lutris

    #NOTE: minecraft
    prismlauncher
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ruiz/.steam/steam/compatibilitytools.d/LegacyRuntime/compatibilitytool.vdf";
  };

  #NOTE: roblox

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo     '';
  };
}
