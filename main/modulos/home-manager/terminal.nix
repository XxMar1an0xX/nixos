{...}: {
  programs.kitty = {
    enable = true;
    extraConfig =
      /*
      conf
      */
      ''
        cursor_trail 1
        confirm_os_window_close 0
        map ctrl+c copy_or_interrupt
        map ctrl+v paste_from_clipboard
      '';

    settings = {
      enable_audio_bell = false;
    };
  };
}
