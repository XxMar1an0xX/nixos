{
  programs.nixvim = {
    plugins.rustaceanvim = {
      enable = true;
      # settings = {
      #   full = true;
      #   server = {
      #     cmd = [
      #       "rustup"
      #       "rust-analyzer"
      #     ];
      #     default_settings = {
      #       rust-analyzer = {
      #       };
      #     };
      #   };
      # };
    };
  };
}
