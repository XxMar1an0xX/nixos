{
  pkgs,
  modulesPath,
  inputs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ./modulos/config/programas_esenciales.nix
    ./modulos/estetica/stylix.nix
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
  ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  users.users = {
    Ruiz = {
      isNormalUser = true;
      description = "Portable Ruiz";
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = "$y$j9T$130s2ATsRL5ixDudKitBG/$bqE8TWji9UmfWrZgX/791zqONEFPu7ivzPS/PmjN0j7";
    };
  };
  time.timeZone = "America/Argentina/Tucuman";
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  home-manager = {
    users = {
      "Ruiz" = import ./home.nix;
    };
    extraSpecialArgs = {inherit inputs;};
  };
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      unmanaged = ["*-foo-bar"];
    };
  };
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };
  console.keyMap = "la-latin1";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}
