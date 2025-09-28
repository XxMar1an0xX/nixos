{
  config,
  CondicionalPortable,
  ...
}: {
  #TODO: NO FUNCIONA INVIDIOUSU
  services.invidious = CondicionalPortable {} {
    # enable = false;
    enable = true;
    nginx.enable = false;
    address = "127.0.0.1";
    port = 12345;
    sig-helper.enable = true;
    http3-ytproxy.enable = true;
    # if you want to disable recommended videos
    settings = {
      # db.user = "invidious";
      default_user_preferences = {
        "locale" = "es";
        "feed_menu" = ["Subscriptions" "Playlists" "Trending"];
        "related_videos" = true;
        "popular_enabled" = true;
        "default_home" = "Subscriptions";
        "dark_mode" = "dark";
        "captions" = ["Spanish (Latin America)" "English" "English (auto-generated)"];
        "region" = "AR";
        "preload" = true;
        "video_loop" = true;
        "quality" = "dash";
        "quality_dash" = "480p";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [config.services.invidious.port];
}
