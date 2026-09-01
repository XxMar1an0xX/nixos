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
      frontendHostname = "holabb";
    };
  };
}
