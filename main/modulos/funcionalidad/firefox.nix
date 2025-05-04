{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableAccounts = true;
      DefaultDownloadDirectory = "/home/portable/Descargas/";
    };
    languagePacks = ["es-AR"];
    profiles.Ruiz = {
      isDefault = true;
      id = 1;
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "query";
                  value = "{seachTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          "Startpage" = {
            urls = [
              {
                template = "https://www.startpage.com/es/";
                params = [
                  {
                    name = "query";
                    value = "searchTerms";
                  }
                ];
              }
            ];
          };
        };
      };
      extensions = [
      ];
    };
  };
}
