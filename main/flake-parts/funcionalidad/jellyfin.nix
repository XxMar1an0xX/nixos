{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.invidious = {pkgs, ...}: {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
