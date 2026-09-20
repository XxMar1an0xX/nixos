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
      signal.relayHosts = ["192.168.1.18:21117"];
      relay.enable = true;
    };

    services.rustdesk-client = {
      enable = true;
      package = pkgs.rustdesk-flutter;
      niri.enable = true;
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
