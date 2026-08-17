{
  self,
  inputs,
  ...
}: {
  flake.modules.firefox.ublock = {
    pkgs,
    lib,
    ...
  }: {
    programs.firefox = {
      policies.ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          # install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      profiles.ruiz.extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
        ];
        settings."uBlock0@raymondhill.net".settings = {
          enabled = true;
          selectedFilterLists = [
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-unbreak"
            "ublock-quick-fixes"
            "user-filters"
            "easylist"
            "adguard-generic"
            "easyprivacy"
            "LegitimateURLShortener"
            "adguard-spyware-url"
            "block-lan"
            "urlhaus-1"
            "curben-phishing"
            "plowe-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "adguard-cookies"
            "ublock-cookies-adguard"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
            "spa-1"
            "spa-0"
            # "https://filters.adtidy.org/extension/ublock/filters/3.txt"
          ];
        };
      };
    };
  };
}
