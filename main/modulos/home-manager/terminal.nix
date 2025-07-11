{...}: {
  programs.kitty = {
    enable = true;
    # extraConfig = ''
    #   startup_session ./inicio.conf
    # '';

    settings = {
      enable_audio_bell = false;
    };
  };
}
