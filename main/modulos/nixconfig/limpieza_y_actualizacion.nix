{
  lib,
  config,
  ...
}: {
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 20d";
  };
  nix.settings.auto-optimise-store = true;
}
