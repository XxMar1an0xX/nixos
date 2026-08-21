{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.caddy = {pkgs, ...}: {
    networking.firewall.allowedTCPPorts = [80 433];
    security.acme = {
      acceptTerms = true;
    };
    services.nginx = {
      enable = true;

      #NOTE: por alguna razon romple invidious
      # recommendedProxySettings = true;

      virtualHosts."invidious.local" = {
        enableACME = true;
        forceSSL = true;
        listen = [
          {
            addr = "0.0.0.0";
            port = 80;
          }
        ];

        locations."/" = {
          proxyPass = "http://127.0.0.1:3000";
          # proxyWebsockets = true;

          extraConfig = ''
            # proxy_pass http://127.0.0.1:3000;
            # Needed for alternative domains to work, check Invidious `config.example.yml`
            # file to get more details on how it works.
            proxy_set_header X-Forwarded-Host $host;
            proxy_http_version 1.1;     # to keep alive
            proxy_set_header Connection ""; # to keep alive
          '';
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
