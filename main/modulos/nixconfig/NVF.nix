{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
                
    settings.vim = {
        extraPackages = with pkgs; [cargo alejandra];
      viAlias = true;
      vimAlias = true;

      theme = lib.mkForce {
        enable = true;
        # name = "nord"; #NOTE: hacer como el tema anterior de nixvim "nightfox/nordfox"
        # style = "dark";
        base16-colors = {
          base00 = "2e3440";
          base01 = "39404f";
          base02 = "444c5e";
          base03 = "465780";
          base04 = "7e8188";
          base05 = "cdcecf";
          base06 = "abb1bb";
          base07 = "e7ecf4";
          base08 = "bf616a";
          base09 = "c9826b";
          base0A = "ebcb8b";
          base0B = "a3be8c";
          base0C = "88c0d0";
          base0D = "81a1c1";
          base0E = "b48ead";
          base0F = "bf88bc";
        };
      };

      spellcheck = {
        enable = true;
      };

      keymaps = [
        {
          key = "<leader>t";
          mode = "n";
          silent = true;
          action = ":Neotree toggle<CR>";
        }
      ];

      lsp = {
        formatOnSave = true;
        mappings.format = "<leader>ft";
        enable = true; #NOTE: lacra de mrd como 2 horas boludeando para q sea esto
        # lspkind.enable = false;
        lightbulb.enable = true;
        # lspsaga.enable = false;
        trouble.enable = true;
      };

      formatter.conform-nvim = {
        # enable = true;
        #
        # setupOpts.formaters_by_ft = {
        #   nix = [
        #     "alejandra"
        #   ];
        # };
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix = {
          enable = true;
          extraDiagnostics.enable = true;
          format = {
            enable = true;
            type = "alejandra";
          };
          lsp = {
            enable = true;
            server = "nixd";
            options = {
              filetypes = [
                "nix"
              ];
              formatting.command = ["alejandra"];
              options = {
                "home_manager".expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.options.home-manager.users.value.ruiz";
                #
                nixos.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.options";
                # nixvim.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.config.home-manager.users.ruiz.programs.nixvim";
                # # nix-on-droid.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixOnDroidConfigurations.default.options";
                #
                # lib-macros.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.lib";
              };
            };
          };
          treesitter.enable = true;
        };
        rust = {
          enable = true;
          crates = {
            enable = true;
            codeActions = true;
          };
          dap.enable = true;
          format.enable = true;
          lsp = {
            enable = true;
            opts = ''
               ['rust-analyzer'] = {
                cargo = {allFeature = true},
                checkOnSave = true,
                procMacro = {
                  enable = true,
                },
              },
            '';
          };
          treesitter.enable = true;
        };
      };

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_diagnostics = true;
          enable_git_status = true;
          enable_modified_markers = true;
          enable_refresh_on_write = true;
        };
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;

      autocomplete = {
        # nvim-cmp.enable = true;
        blink-cmp.enable = true;
      };

      # snippets.luasnip.enable = true;

      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
        # hardtime-nvim.enable = isMaximal;
      };

      utility = {
        smart-splits.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
      };

      notes = {
        todo-comments.enable = true;
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        fastaction.enable = true;
      };
    };
  };
        # environment.systemPackages = [pkgs.cargo];
}
