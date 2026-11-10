{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kitty = {lib, ...}: {
    programs.kitty = {
      enable = true;
      # extraConfig =
      #   /*
      #   conf
      #   */
      #   ''
      #     cursor_trail 1
      #     confirm_os_window_close 0
      #     map ctrl+c copy_or_interrupt
      #     map ctrl+v paste_from_clipboard
      #   '';

      settings = lib.mkForce {
        cursor_trail = 1;
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        cursor_stop_blinking_after = 0;
        bell_on_tab = true;
        background_opacity = 0.85;
        allow_remote_control = true;
        dynamic_background_opacity = true;
        # custom_shaders = "inside-the-matrix";
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+v" = "paste_from_clipboard";
      };
    };
  };
}
