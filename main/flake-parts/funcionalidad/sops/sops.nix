{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sops = {config, ...}: {
    imports = [inputs.sops-nix.nixosModules.sops];

    sops = {
      defaultSopsFile = ./../../../recursos/secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/ruiz/.config/sops/age/keys.txt";
      secrets.github_token = {};
    };

    environment.sessionVariables = {
      GH_TOKEN = "$(cat ${config.sops.secrets.github_token.path})";
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
