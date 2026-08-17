{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.engines = {
    pkgs,
    lib,
    ...
  }: {
    programs.firefox.profiles.ruiz.search = {
      force = true;
      order = ["Startpage" "Nix Packages" "Home-Manager"];
      privateDefault = "Startpage";
      engines = {
        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@no"];
        };
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };
        "Startpage" = {
          urls = [
            {
              template = "https://www.startpage.com/sp/search?q={searchTerms}";
            }
          ];
          icon = "https://design.system1.com/wp-content/uploads/2023/02/startpage-icon.svg";
        };
        "Home-Manager" = {
          urls = [
            {
              template = "https://home-manager-options.extranix.com/?query={searchTerms}";
            }
          ];
          icon = "https://avatars.githubusercontent.com/u/33221035?s=48&v=4";
          definedAliases = ["@hm"];
        };
        "Searxng" = {
          urls = [
            {template = "http://127.0.0.1:5050/search?q={searchTerms}";}
          ];
          definedAliases = ["@sx"];
        };
      };
      default = "Searxng";
    };
  };
}
