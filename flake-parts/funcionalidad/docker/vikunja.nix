{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.vikunja = {
    pkgs,
    lib,
    ...
  }: {
    services.vikunja = {
      enable = true;
      frontendScheme = "http";
      port = 3456;
      frontendHostname = "localhost";

      settings = {
        service = {
          service = {
            publicurl = "https://taskyruiz.duckdns.org";
            enablecaldav = true;
          };
        };
      };
    };
  };
}
