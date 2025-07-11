{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      cursor_trail 1
    '';

    settings = {
      enable_audio_bell = false;
    };
  };
}
