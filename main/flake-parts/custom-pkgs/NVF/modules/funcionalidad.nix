{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.funcionalidad = {
    pkgs,
    lib,
    ...
  }: {
    config.vim = {
      extraPackages = with pkgs; [
        ripgrep
        # wl-clipboard
        gcc
        # cargo
        # rustc
        # clipse #TODO: compartir el clipboard entre sistema y editor
        lldb
        fzf
        # git
        # gh
        # clang-tools
      ];
      keymaps = [
        {
          key = "<leader>fs";
          mode = "n";
          silent = true;
          action = ":Neotree toggle<CR>";
        }
        {
          key = "<leader>t";
          mode = "t";
          silent = true;
          action = "exit \n";
        }
        # {
        #   key = "<Esc>";
        #   mode = "t";
        #   silent = true;
        #   # action = "";
        # }
        # {
        #   key = "<leader>t";
        #   mode = "n";
        #   silent = true;
        #   action = "";
        # }
      ];
      viAlias = true;
      vimAlias = true;
      #NOTE: notificaciones de eroores en la barra inferior
      diagnostics = {
        enable = true;
        config = {
          update_in_insert = true;
          virtual_lines = true;
        };
      };

      #NOTE: habilitar clipboard universal
      clipboard = {
        enable = true;
        providers = {
          # wl-copy.enable = true;
          # clipse.enable = true;
        };
        registers = "unnamedplus";
      };

      #NOTE: creo que es mejor simplemente tener otra ventana de terminal abierta
      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
          mappings = {
            open = "<leader>t";
          };
          setupOpts = {
            insert_mappings = true;
            terminal_mappings = true;
            # start_in_insert = false;
          };
        };
      };

      #NOTE: buscador por exelencia
      telescope = {
        enable = true;
      };

      #NOTE: innegociable git/lazygit
      git = {
        enable = true;
        gitsigns = {
          enable = true;
          codeActions.enable = false;
        };
      };

      #NOTE: servira mucho en rust
      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      #NOTE: super util barra lateral
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_diagnostics = true;
          enable_git_status = true;
          enable_modified_markers = true;
          enable_refresh_on_write = true;
        };
      };

      snippets.luasnip.enable = true;

      #NOTE: cheatsheet es util
      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
        # hardtime-nvim.enable = isMaximal;
      };

      #NOTE: aun nose bien que hace cada cosa
      utility = {
        ccc.enable = false;
        # surround.enable = true;

        smart-splits.enable = true;
        # vim-wakatime.enable = true;
        #NOTE: seleccionar iconos
        icon-picker.enable = true;
        # diffview-nvim.enable = true;

        motion = {
          #NOTE: hop tiene potencial per o aun no
          # hop.enable = true;

          #NOTE: muchisimo potencial pero se tiene que aprender
          # leap.enable = true;
        };
        images = {
          # image-nvim.enable = false;
        };
        #TODO: hacer son sops/secrets autologin en leetcode
        leetcode-nvim = {
          enable = true;
          setupOpts = {
            image_support = true;
            lang = "rust";
          };
        };
      };
    };
  };
}
