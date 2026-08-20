{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.caddy = {pkgs, ...}: {
    networking.firewall.allowedTCPPorts = [80];
    services.nginx = {
      enable = true;

      recommendedProxySettings = true;

      virtualHosts."invidious.local" = {
        listen = [
          {
            addr = "192.168.1.50";
            port = 80;
          }
        ];

        locations."/" = {
          proxyPass = "http://127.0.0.1:3000";
          proxyWebsockets = true;
        };
      };
    };
    # networking.hosts = {
    #   "127.0.0.1" = ["localhost"];
    #   # "192.168.0.2" = ["fileserver.local" "nameserver.local"];
    #   "::1" = ["localhost"];
    #   "192.168.0.10" = ["aottr.local"];
    # };
  };
}
