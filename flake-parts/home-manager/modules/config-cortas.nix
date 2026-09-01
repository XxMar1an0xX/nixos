{
  self,
  inputs,
  ...
}: {
  flake.homeModules.config-cortas = {
    lib,
    pkgs,
    ...
  }: {
    programs = {
      yazi = {
        enable = true;
        shellWrapperName = "y";
        settings = {
          mgr = {
            scrolloff = 4;
            linemode = "mtime";
            sort_by = "mtime";
            sort_reverse = true;
            sort_dir_first = true;
            show_hidden = true;
          };
          keymap.mgr = {
            prepend_keymap = {
              on = "!";
              for = "unix";
              run = ''shell "$SHELL" --block'';
              desc = "Open $SHELL here";
            };
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
          proc_sorting = "memory";
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
        # settings = lib.mkForce (builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
        #     owner = "fredericrous";
        #     repo = "dotfiles";
        #     rev = "cf793fb3f87f8de1eb2e7c90a23252226d8aaf70";
        #     hash = "sha256-yr6HasmCorNsVRVeix3OM5Acqwk7K23HCvMMqyi0RT8=";
        #   }
        #   + "/private_dot_config/starship.toml")));
        # # + "/dotfiles/config/starship.toml")));
        settings = lib.mkForce (builtins.fromTOML (builtins.readFile ./../../../recursos/starship.toml));
      };

      bash = {
        enable = true;
        shellAliases = {
        };
      };
    };
    services = {
      clipse = {
        # enable = true;
        # imageDisplay.type = "kitty";
      };
    };

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        # package = pkgs.papirus-icon-theme;
      };
    };
  };
}
