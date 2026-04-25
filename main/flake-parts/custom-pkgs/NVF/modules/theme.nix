{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.theme = {
    pkgs,
    lib,
    ...
  }: {
    config.vim = {
      extraPlugins = {
        nighfox = {
          package = pkgs.vimPlugins.nightfox-nvim;
          setup =
            /*
            lua
            */
            ''
              require('nightfox').setup {}
              vim.cmd("colorscheme nordfox")
            '';
        };
      };

      comments = {
        comment-nvim.enable = true;
      };
      theme = lib.mkForce {
        enable = false;
        extraConfig = ''
        '';
        # name = "nord";
        # style = "dark";
        # base16-colors = {
        #   base00 = "2e3440";
        #   base01 = "39404f";
        #   base02 = "444c5e";
        #   base03 = "465780";
        #   base04 = "7e8188";
        #   base05 = "cdcecf";
        #   base06 = "abb1bb";
        #   base07 = "e7ecf4";
        #   base08 = "bf616a";
        #   base09 = "c9826b";
        #   base0A = "ebcb8b";
        #   base0B = "a3be8c";
        #   base0C = "88c0d0";
        #   base0D = "81a1c1";
        #   base0E = "b48ead";
        #   base0F = "bf88bc";
        # };
      };
      notify = {
        nvim-notify.enable = true;
      };
      dashboard = {
        dashboard-nvim.enable = false;
        alpha = {
          enable = true;
          theme = "startify";
        };
      };
      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline = {
          enable = true;
          setupOpts = {
            cursorline = {
              enable = true;
              timeout = 0;
            };
          };
        };
        # cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        nvim-scrollbar.enable = true;

        highlight-undo = {
          enable = true;
          setupOpts = {
            duration = 100;
          };
        };
        indent-blankline.enable = true;
      };
      treesitter = {
        context.enable = true;

        grammars = with pkgs.vimPlugins.nvim-treesitter.parsers; [
          arduino
          asm
        ];
      };
      statusline = {
        lualine = {
          enable = true;
          theme = "nord";
        };
      };
      notes = {
        todo-comments.enable = true;
        # mind-nvim.enable = true;
      };
      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        # illuminate.enable = true;
        # fastaction.enable = true;
        #TODO: aprender a usar navbuddy
        # breadcrumbs = {
        #   enable = true;
        #   navbuddy.enable = true;
        # };

        # smartcolumn = {
        #   enable = true;
        #   setupOpts.custom_colorcolumn = {
        #     # this is a freeform module, it's `buftype = int;` for configuring column position
        #     rust = "100";
        #     nix = "110";
        #     ruby = "120";
        #     java = "130";
        #     go = ["90" "130"];
        #   };
        # };
      };
    };
  };
}
