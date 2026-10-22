{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.searxng = {pkgs, ...}: {
    #NOTE: searxng estara disponible en:
    # http://127.0.0.1:5050/
    environment.systemPackages = with pkgs; [
      searxng
    ];
    services.searx = {
      enable = true;
      # redisCreateLocally = true;
      # openFirewall = true;
      settings = {
        server = {
          bind_address = "127.0.0.1";
          port = 5050;
          secret_key = "holabb";
        };
        general = {
          enable_metrics = true;
        };
        ui = {
          # default_locale = "all";
          hotkeys = "vim";
          query_in_title = false;
          url_formatting = "pretty";
          infinite_sroll = true;
          results_on_new_tab = true;
        };
        search = {
          autocomplete = "";
          safe_search = 0;
          default_lang = "all";
        };
        plugins = {
          "searx.plugins.calculator.SXNGPlugin".active = true;
          "searx.plugins.infinite_scroll.SXNGPlugin".active = true;
          "searx.plugins.unit_converter.SXNGPlugin".active = true;
          # "searx.plugins.time_zone.SXNGPlugin".active = true;
          "searx.plugins.tracker_url_remover.SXNGPlugin".active = true;
          "searx.plugins.hostnames.SXNGPlugin".active = true;
        };
        hostnames.replace = {
          "(.*\\.)?youtube\\.com$" = "invidiousruiz.duckdns.org";
          "(.*\\.)?youtu\\.be$" = "invidiousruiz.duckdns.org";
        };
      };
    };
  };
}
