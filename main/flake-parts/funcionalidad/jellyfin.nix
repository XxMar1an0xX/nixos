{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.jellyfin = {pkgs, ...}: {
    #NOTE: jellyfin local host
    # http://localhost:8096/
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
