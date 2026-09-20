{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.rustdesk-server = {
    config,
    lib,
    pkgs,
    ...
  }: {
    services.rustdesk-server = {
      enable = true;
      openFirewall = true;
      signal.relayHosts = ["rustdeskruiz.duckdns.org:21117"];
      relay.enable = true;
    };
    networking.firewall = {
      allowedTCPPorts = [
        21115
        21116
        21117
        21118
        21119
      ];

      allowedUDPPorts = [
        21116
      ];
    };
  };
}
