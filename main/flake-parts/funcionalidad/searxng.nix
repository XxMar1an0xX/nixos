{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.searxng = {pkgs, ...}: {
    #NOTE: searxng estara disponible en:
    # http://127.0.0.1:5050/
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
