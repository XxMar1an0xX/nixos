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
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    services.vikunja = {
      enable = true;
      frontendScheme = "https";
      port = 3456;
      frontendHostname = "taskyruiz.duckdns.org";
      database.type = "sqlite";

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
