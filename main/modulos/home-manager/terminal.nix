{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      cursor_trail 1
      confirm_os_window_close 0
    '';

    settings = {
      enable_audio_bell = false;
    };
  };
}
