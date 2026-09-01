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
      database.type = "mysql";

      settings = {
        service = {
          service = {
            publicurl = "taskyruiz.duckdns.org";
            enablecaldav = true;
          };
        };
      };
    };
  };
}
