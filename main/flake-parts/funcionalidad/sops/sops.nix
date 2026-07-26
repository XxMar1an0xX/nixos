{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sops = {...}: {
    imports = [inputs.sops-nix.nixosModules.sops];

    sops = {
      defaultSopsFile = ./../../../recursos/secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/ruiz/.config/sops/age/keys.txt";
      secrets.example-key = {};
    };

    #NOTE: openssh keygen
    # services.openssh = {
    #   enable = true;
    #   hostKeys = [
    #     {
    #       type = "ed25519";
    #       path = "/etc/ssh/ssh_host_ed25519_key";
    #     }
    #   ];
    # };
  };
}
