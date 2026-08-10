{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.invidious = {
    pkgs,
    lib,
    ...
  }: {
    # Runtime
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };
    virtualisation.oci-containers.backend = "docker";

    # Containers
    virtualisation.oci-containers.containers."invidious-companion" = {
      image = "quay.io/invidious/invidious-companion:latest";
      environment = {
        "SERVER_SECRET_KEY" = "eeQuoobaereel5ah";
      };
      volumes = [
        "invidious_companioncache:/var/tmp/youtubei.js:rw"
      ];
      log-driver = "journald";
      autoStart = false;
      extraOptions = [
        "--cap-drop=ALL"
        "--network-alias=companion"
        "--network=invidious_default"
        "--security-opt=no-new-privileges:true"
      ];
    };
    systemd.services."docker-invidious-companion" = {
      serviceConfig = {
        Restart = lib.mkOverride 90 "always";
        RestartMaxDelaySec = lib.mkOverride 90 "1m";
        RestartSec = lib.mkOverride 90 "100ms";
        RestartSteps = lib.mkOverride 90 9;
      };
      after = [
        "docker-network-invidious_default.service"
        "docker-volume-invidious_companioncache.service"
      ];
      requires = [
        "docker-network-invidious_default.service"
        "docker-volume-invidious_companioncache.service"
      ];
    };
    virtualisation.oci-containers.containers."invidious-invidious" = {
      image = "quay.io/invidious/invidious:latest";
      environment = {
        "INVIDIOUS_CONFIG" = "db:
    dbname: invidious
    user: kemal
    password: kemal
    host: invidious-db
    port: 5432
  check_tables: true
  invidious_companion:
  # URL used for the internal communication between invidious and invidious companion
  # There is no need to change that except if Invidious companion does not run on the same docker compose file.
  - private_url: \"http://companion:8282/companion\"
  # IT is NOT recommended to use the same key as HMAC KEY. Generate a new key!
  # Use the key generated in the 2nd step
  invidious_companion_key: \"eeQuoobaereel5ah\"
  # external_port:
  # domain:
  # https_only: false
  # statistics_enabled: false
  # Use the key generated in the 1st step
  hmac_key: \"ahZ0johrae9ZaiNg\"
  ";
      };
      ports = [
        "127.0.0.1:3000:3000/tcp"
      ];
      dependsOn = [
        "invidious-invidious-db"
      ];
      log-driver = "journald";
      autoStart = false;
      extraOptions = [
        "--health-cmd=wget -nv --tries=1 --spider http://127.0.0.1:3000/api/v1/stats || exit 1"
        "--health-interval=30s"
        "--health-retries=2"
        "--health-timeout=5s"
        "--network-alias=invidious"
        "--network=invidious_default"
      ];
    };
    systemd.services."docker-invidious-invidious" = {
      serviceConfig = {
        Restart = lib.mkOverride 90 "always";
        RestartMaxDelaySec = lib.mkOverride 90 "1m";
        RestartSec = lib.mkOverride 90 "100ms";
        RestartSteps = lib.mkOverride 90 9;
      };
      after = [
        "docker-network-invidious_default.service"
      ];
      requires = [
        "docker-network-invidious_default.service"
      ];
    };
    virtualisation.oci-containers.containers."invidious-invidious-db" = {
      image = "docker.io/library/postgres:14";
      environment = {
        "POSTGRES_DB" = "invidious";
        "POSTGRES_PASSWORD" = "kemal";
        "POSTGRES_USER" = "kemal";
      };
      volumes = [
        "/home/ruiz/Downloads/inv/invidious/config/sql:/config/sql:rw"
        "/home/ruiz/Downloads/inv/invidious/docker/init-invidious-db.sh:/docker-entrypoint-initdb.d/init-invidious-db.sh:rw"
        "invidious_postgresdata:/var/lib/postgresql/data:rw"
      ];
      log-driver = "journald";
      autoStart = false;
      extraOptions = [
        "--health-cmd=pg_isready -U $POSTGRES_USER -d $POSTGRES_DB"
        "--network-alias=invidious-db"
        "--network=invidious_default"
      ];
    };
    systemd.services."docker-invidious-invidious-db" = {
      serviceConfig = {
        Restart = lib.mkOverride 90 "always";
        RestartMaxDelaySec = lib.mkOverride 90 "1m";
        RestartSec = lib.mkOverride 90 "100ms";
        RestartSteps = lib.mkOverride 90 9;
      };
      after = [
        "docker-network-invidious_default.service"
        "docker-volume-invidious_postgresdata.service"
      ];
      requires = [
        "docker-network-invidious_default.service"
        "docker-volume-invidious_postgresdata.service"
      ];
    };

    # Networks
    systemd.services."docker-network-invidious_default" = {
      path = [pkgs.docker];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = "docker network rm -f invidious_default";
      };
      script = ''
        docker network inspect invidious_default || docker network create invidious_default
      '';
      partOf = ["docker-compose-invidious-root.target"];
      wantedBy = ["docker-compose-invidious-root.target"];
    };

    # Volumes
    systemd.services."docker-volume-invidious_companioncache" = {
      path = [pkgs.docker];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        docker volume inspect invidious_companioncache || docker volume create invidious_companioncache
      '';
      partOf = ["docker-compose-invidious-root.target"];
      wantedBy = ["docker-compose-invidious-root.target"];
    };
    systemd.services."docker-volume-invidious_postgresdata" = {
      path = [pkgs.docker];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        docker volume inspect invidious_postgresdata || docker volume create invidious_postgresdata
      '';
      partOf = ["docker-compose-invidious-root.target"];
      wantedBy = ["docker-compose-invidious-root.target"];
    };

    # Root service
    # When started, this will automatically create all resources and start
    # the containers. When stopped, this will teardown all resources.
    systemd.targets."docker-compose-invidious-root" = {
      unitConfig = {
        Description = "Root target generated by compose2nix.";
      };
    };
  };
}
