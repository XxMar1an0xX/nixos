{
  lib,
  pkgs,
  ...
}: {
  services.invidious = {
    enable = true;
    nginx.enable = false;
    address = "127.0.0.2";
    port = 2000;
    sig-helper.enable = true;

    # if you want to disable recommended videos
    settings = {
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
}
