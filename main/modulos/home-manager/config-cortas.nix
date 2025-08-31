{...}: {
  programs.yazi = {
    settings.yazi = {
      manager = {
        sort_by = "mtime";
        show_hidden = true;
        sort_dir_first = true;
        scrolloff = 4;
      };
    };
  };
}
