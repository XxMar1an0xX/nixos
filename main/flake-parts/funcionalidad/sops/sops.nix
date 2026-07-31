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
        "wifi/casa" = {};
        "wifi/armor" = {};
      };
    };

    environment.sessionVariables = {
      # GH_TOKEN = "$(<${config.sops.secrets.github_token.path})";
    };

    networking.networkmanager.ensureProfiles.profiles = {
      casa = {
        connection = {
          id = "casa";
          type = "wifi";
          autoconnect = true;
        };
        wifi = {
          mode = "infrastructure";
          ssid = "Personal-422";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$FILE{/run/secrets/wifi/casa}";
        };

        ipv4.method = "auto";
        ipv6.method = "auto";
      };
      zona-wifi = {
        connection = {
          id = "zona-wifi";
          type = "wifi";
          autoconnect = true;
        };
        wifi = {
          mode = "infrastructure";
          ssid = "Armor 24";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$FILE{/run/secrets/wifi/armor}";
        };

        ipv4.method = "auto";
        ipv6.method = "auto";
      };
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
