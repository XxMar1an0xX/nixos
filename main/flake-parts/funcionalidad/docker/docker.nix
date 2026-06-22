{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.docker = {
    config,
    pkgs,
    ...
  }: {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    virtualisation.oci-containers = {
      backend = "docker";
      # containers = {
      #   winapps = {
      #     autoStart = true;
      #   };
      # };
    };
    #NOTE: this is root acess
    # users.users.ruiz.extraGroups = ["docker"];
  };
}
