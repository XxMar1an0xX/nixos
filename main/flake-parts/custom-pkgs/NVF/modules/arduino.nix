{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.arduino = {
    pkgs,
    lib,
    # self',
    ...
  }: {
    config.vim = {
      #NOTE: dependencias
      extraPackages = with pkgs; [
        # arduino-cli
        arduino-language-server
        llvmPackages_19.clang-tools
        # clang-tools
      ];
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
              "${self.packages.${pkgs.stdenv.hostPlatform.system}.arduinoPatched}/bin/arduino-cli"
              # "${hola}/bin/arduino-cli"
              # "${pkgs.clang-tools}/bin/clangd"
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
        };
        #NOTE: nunca olvidar esta opcion
        enable = true;
        formatOnSave = true;
        lspconfig.enable = true;
        mappings.format = "<leader>ft";
      };
    };
  };
}
