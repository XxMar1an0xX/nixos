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
        alejandra
        # clipse #TODO: compartir el clipboard entre sistema y editor
        lldb
        fzf
        nerd-fonts.symbols-only
        # git
        # gh
        # arduino-cli
        arduino-language-server
        llvmPackages_22.clang-tools
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

      lsp = {
        servers = {
          arduino = {
            #NOTE: si hay error verificar que el board este installado con:
            # arduino-cli core install
            enable = true;
            capabilities =
              lib.generators.mkLuaInline
              /*
              lua
              */
              ''
                {
                        textDocument = {
                                semanticTokens = vim.NIL,
                        },
                        workspace = {
                                semanticTokens = vim.NIL,
                        },
                }
              '';
            cmd = [
              "${pkgs.arduino-language-server}/bin/arduino-language-server"
              # "arduino-language-server"
              "-clangd"
              "clangd"
              "-cli-config"
              "/home/ruiz/.arduino15/arduino-cli.yaml"
              "-cli"
              # "arduino-cli"
              # "${hola}/bin/arduino-cli"
              "${pkgs.clang-tools}/bin/clangd"
              "-fqbn"
              "arduino:avr:uno"
            ];
            filetypes = ["arduino"];
            root_dir =
              lib.generators.mkLuaInline
              /*
              lua
              */
              ''
                function(bufnr, on_dir)
                    on_dir(vim.fn.expand "%:p:h")
                 end'';
          };

          nixd.settings.nixd.options = let
            flake = "(builtins.getFlake \"/home/ruiz/nixos/main\")";
          in {
            # nixpkgs.expr = "import <nixpkgs> { }";
            nixos.expr = flake + ".nixosConfigurations.nixos.options";
            home-manager.expr = flake + ".nixosConfigurations.nixos.options.home-manager.users.value.ruiz";
            nix-on-droid.expr = flake + ".nixOnDroidConfigurations.default.options";
            # lib-macros.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.lib";
          };
        };
        enable = true; #NOTE: lacra de mrd como 2 horas boludeando para q sea esto
        formatOnSave = true;
        lspconfig.enable = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        # lspSignature.enable = true;
        otter-nvim = {
          enable = true;
          setupOpts = {
            lsp.handle_leading_whitespace = true;
            strip_wrapping_quote_characters = ["'" "\"" "`" "\'\'"];
          };
        };
        nvim-docs-view.enable = true;

        mappings.format = "<leader>ft";
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
            type = ["alejandra"];
          };
          lsp = {
            enable = true;
            servers = ["nixd"];
          };
          treesitter = {
            enable = true;
          };
        };
        rust = {
          enable = true;
          extensions.crates-nvim = {
            enable = true;
            # codeActions = true;
          };
          dap.enable = true;
          format.enable = true;
          lsp = {
            enable = true;
            # opts = ''
            #    ['rust-analyzer'] = {
            #     cargo = {allFeature = true},
            #     checkOnSave = true,
            #     procMacro = {
            #       enable = true,
            #     },
            #   },
            # '';
          };
          treesitter.enable = true;
        };

        #NOTE: lenguajes extras
        clang.enable = true;
        lua.enable = true;
        markdown.enable = true;
        python.enable = true;
        bash = {
          enable = true;
          format.enable = true;
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

      #NOTE: autocompletado
      autopairs.nvim-autopairs.enable = true;
      autocomplete = {
        enableSharedCmpSources = true;
        # nvim-cmp.enable = true;
        blink-cmp = {
          friendly-snippets.enable = true;
          enable = true;
          sourcePlugins = {
            ripgrep.enable = true;
            spell.enable = true;
          };
          setupOpts = {
            keymap.preset = "super-tab";
            completion.documentation.auto_show = true;
            fuzzy.implementation = "prefer_rust_with_warning";
          };
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
        surround.enable = true;
        smart-splits.enable = true;
        # vim-wakatime.enable = true;
        icon-picker.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
        images = {
          image-nvim.enable = false;
        };
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
