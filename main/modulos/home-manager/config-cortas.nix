{...}: {
  programs = {
    yazi = {
      enable = true;
      settings.yazi = {
        manager = {
          sort_by = "mtime";
          show_hidden = true;
          sort_dir_first = true;
          scrolloff = 4;
          linemode = "mtime";
        };
      };
    };
    btop = {
      enable = true;
      settings = {
        color_theme = "nord";
        update_ms = 500;
        graph_symbol = "braille";
        truecolor = true;
        theme_background = true;
        base_10_sizes = true;
      };
    };
    keepassxc = {
      enable = true;
      settings = {
        Browser.Enabled = true;
      };
    };
    cava = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
