{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.searxng = {pkgs, ...}: {
    services.searx = {
      enable = true;
      redisCreateLocally = false;
      settings = {
        server = {
          bind_address = "::1";
          port = 5050;
        };
      };
    };
  };
}
