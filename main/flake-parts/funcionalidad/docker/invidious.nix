{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.invidious = {pkgs, ...}: {
    #NOTE: ES MUY IMPORTANTE MANTENER ACTUALIZADO INVIDIOUS POR MEDIO DE FLAKES UPDATE
    #http://127.0.0.1:3000
    services.invidious = {
      enable = true;
      package = pkgs.invidious;

      # Same externally visible port as your Docker setup.
      port = 3000;

      # Listen only locally if nginx/Caddy will proxy it.
      # Use "0.0.0.0" if you want port 3000 directly accessible.
      address = "127.0.0.1";

      database.createLocally = true;

      settings = {
        db = {
          dbname = "invidious";
          user = "invidious";
        };

        check_tables = true;

        invidious_companion = [
          {
            private_url = "http://127.0.0.1:8282/companion";
          }
        ];

        #TODO: seria mejor hacerlo sops dependiente
        invidious_companion_key = "pee5Iupahneithij";
        hmac_key = "eec2Eeth2ReiBuukiew2";
      };
    };

    # PostgreSQL is managed declaratively by NixOS.
    services.postgresql = {
      enable = true;
    };
    virtualisation.oci-containers.backend = "docker";

    virtualisation.oci-containers.containers.invidious-companion = {
      image = "quay.io/invidious/invidious-companion:latest";

      environment = {
        #TODO: seria mejor hacerlo sops dependiente
        SERVER_SECRET_KEY = "pee5Iupahneithij";
        HOST = "127.0.0.1";
        PORT = "8282";
      };

      extraOptions = [
        "--network=host"
        "--cap-drop=ALL"
        "--read-only"
        "--security-opt=no-new-privileges:true"
      ];

      volumes = [
        "companioncache:/var/tmp/youtubei.js:rw"
      ];
    };
  };
}
