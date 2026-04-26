{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.nix = {pkgs, ...}: {
    config.vim = {
      #NOTE: alejandra formatter
      extraPackages = with pkgs; [
        alejandra
      ];

      lsp = {
        #NOTE: nunca olvidar esta opcion
        enable = true;
        formatOnSave = true;
        lspconfig.enable = true;
        mappings.format = "<leader>ft";
      };

      #NOTE: LSP server nixd
      lsp.servers = {
        #NOTE: nixd config
        nixd.settings.nixd.options = let
          flake = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\")";
        in {
          # nixpkgs.expr = "import <nixpkgs> { }";
          nixos.expr = flake + ".nixosConfigurations.nixos.options";
          home-manager.expr = flake + ".nixosConfigurations.nixos.options.home-manager.users.value.ruiz";
          nix-on-droid.expr = flake + ".nixOnDroidConfigurations.default.options";
          # lib-macros.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.lib";
        };
      };

      #NOTE: formatter y tresitter (?)
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
      };
    };
  };
}
