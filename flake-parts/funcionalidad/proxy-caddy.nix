{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.caddy = {pkgs, ...}: {
    networking.firewall.allowedTCPPorts = [80 443];
    services.caddy = {
      enable = true;
      virtualHosts = {
        "localhost" = {
          extraConfig = ''
            respond "OK"
          '';
        };
      };
    };
    networking.hosts = {
      "127.0.0.1" = ["localhost"];
      # "192.168.0.2" = ["fileserver.local" "nameserver.local"];
      "::1" = ["localhost"];
      "192.168.0.10" = ["aottr.local"];
    };
  };
}
