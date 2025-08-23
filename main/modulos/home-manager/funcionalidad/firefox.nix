{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "allowed";
      };
    };
    profiles.ruiz = {
      search = {
        force = true;
        default = "Startpage";
        order = ["Startpage" "Nix Packages"];
        privateDefault = "Startpage";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          };
          "Startpage" = {
            urls = [
              {
                template = "https://www.startpage.com/sp/search?q={searchTerms}";
              }
            ];
            icon = "https://design.system1.com/wp-content/uploads/2023/02/startpage-icon.svg";
          };
        };
      };
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          sponsorblock
          darkreader
          vimium
        ];
        settings = {
          # "uBlock0@raymondhill.net".settings = {
          #   enabled = true;
          # };
        };
      };
      settings = {
        # "extensions.autoDisableScopes" = 0;
      };
      # extraConfig = ''
      #   user_pref("extensions.autoDisableScopes", 0);
      #   user_pref("extensions.enabledScopes", 15);
      # '';
    };
    # #   # package = pkgs.librewolf;
    # #   policies = {
    # #     DisableAccounts = true;
    # #     DefaultDownloadDirectory = "/home/portable/Descargas/";
    # #   };
    # #   languagePacks = ["es-AR"];
    # #   profiles.Ruiz = {
    # #     isDefault = true;
    # #     id = 1;
    # #     search.engines = {
    # #       "Nix Packages" = {
    # #         urls = [
    # #           {
    # #             template = "https://search.nixos.org/packages";
    # #             params = [
    # #               {
    # #                 name = "query";
    # #                 value = "{seachTerms}";
    # #               }
    # #             ];
    # #           }
    # #         ];
    # #         icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    # #         "Startpage" = {
    # #           urls = [
    # #             {
    # #               template = "https://www.startpage.com/es/";
    # #               params = [
    # #                 {
    # #                   name = "query";
    # #                   value = "searchTerms";
    # #                 }
    # #               ];
    # #             }
    # #           ];
    # #         };
    # #       };
    # #     };
    # #     extensions = [
    # #     ];
    # #   };
  };
  programs.librewolf = {
    enable = true;
    languagePacks = ["es-AR"];
  };
}
