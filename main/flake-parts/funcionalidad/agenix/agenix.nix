{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.agenix = {pkgs, ...}: {
    imports = [inputs.agenix.nixosModules.default];
    environment.systemPackages = [inputs.packages.${pkgs.stdenv.hostPlatform.system}.default];

    #NOTE: openssh keygen
    services.openssh = {
      enable = true;
      hostKeys = [
        {
          type = "ed25519";
          path = "/etc/ssh/ssh_host_ed25519_key";
        }
      ];
    };
  };
}
