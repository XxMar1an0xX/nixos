{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.searxng = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      searxng
    ];
    services.searx = {
      enable = true;
      # redisCreateLocally = true;
      # openFirewall = true;
      settings = {
        server = {
          bind_address = "127.0.0.1";
          port = 5050;
          secret_key = "holabb";
        };
      };
    };
  };
}
