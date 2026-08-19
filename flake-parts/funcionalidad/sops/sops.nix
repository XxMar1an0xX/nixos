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
      secrets = {
        github_token = {
          # owner = "ruiz";
        };
        "wifi/casa" = {
          # key = "wifi/casa";
        };
        "wifi/armor" = {
          # key = "wifi/armor";
        };
        "wifi/box" = {};
      };
    };

    programs.bash.interactiveShellInit =
      /*
      bash
      */
      ''
        # if [ -f "${config.sops.secrets.github_token.path}" ]; then
        #   export GH_TOKEN="$(cat "${config.sops.secrets.github_token.path}")"
        # fi
      '';
    networking.networkmanager.ensureProfiles.environmentFiles = [
      config.sops.secrets."wifi/casa".path
      config.sops.secrets."wifi/armor".path
      config.sops.secrets."wifi/box".path
    ];

    networking.networkmanager.ensureProfiles.profiles = let
      plantilla-redes = name: ssid: pwd: {
        connection = {
          id = name;
          type = "wifi";
          autoconnect = true;
        };
        wifi = {
          mode = "infrastructure";
          ssid = ssid;
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = pwd;
        };

        ipv4.method = "auto";
        ipv6.method = "auto";
      };
    in {
      casa = plantilla-redes "casa" "Personal-422" "$CASA_PWD";
      zona-wifi = plantilla-redes "armor24" "Armor 24" "$ARMOR_PWD";
      box = plantilla-redes "box" "BOX5" "$BOX_PWD";
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
