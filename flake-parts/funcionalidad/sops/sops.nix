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
          key = "wifi/casa";
        };
        "wifi/armor" = {
          key = "wifi/armor";
        };
      };
    };

    programs.bash.interactiveShellInit =
      /*
      bash
      */
      ''
        if [ -f "${config.sops.secrets.github_token.path}" ]; then
          # export GH_TOKEN="$(cat "${config.sops.secrets.github_token.path}")"
        fi
      '';
    networking.networkmanager.ensureProfiles.environmentFiles = [
      config.sops.secrets."wifi/casa".path
      config.sops.secrets."wifi/armor".path
    ];

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
          psk = "$CASA_PWD";
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
          psk = "$ARMOR_PWD";
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
