{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sops = {
    config,
    isLaptop ? false,
    ...
  }: {
    imports = [inputs.sops-nix.nixosModules.sops];

    sops = {
      defaultSopsFile = ./../../../recursos/secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/ruiz/.config/sops/age/keys.txt";
      secrets = let
        host =
          if isLaptop
          then "laptop"
          else "principal";
      in {
        github_token = {
          # owner = "ruiz";
        };
        "wifi/casa" = {
          # key = "wifi/casa";
        };
        "wifi/armor" = {
          key = "wifi/armor";
        };
        "wifi/box" = {};
        "wifi/eliseo" = {};
        "principal/syncthing/key" = {
          path = "/var/lib/syncthing/principal/key.pem";
          owner = "ruiz";
        };
        "principal/syncthing/cert" = {
          path = "/var/lib/syncthing/principal/cert.pem";
          owner = "ruiz";
        };
        "laptop/syncthing/key" = {
          path = "/var/lib/syncthing/laptop/key.pem";
          owner = "ruiz";
        };
        "laptop/syncthing/cert" = {
          path = "/var/lib/syncthing/laptop/cert.pem";
          owner = "ruiz";
        };
      };
    };
    home-manager.users.ruiz.services.syncthing =
      if isLaptop
      then {
        cert = "/var/lib/syncthing/laptop/cert.pem";
        key = "/var/lib/syncthing/laptop/key.pem";
      }
      else {
        cert = "/var/lib/syncthing/principal/cert.pem";
        key = "/var/lib/syncthing/principal/key.pem";
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
      config.sops.secrets."wifi/eliseo".path
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
      casa-eliseo = plantilla-redes "eliseo" "Pelao-5GHz" "$ELISEO_PWD";
    };
  };
}
