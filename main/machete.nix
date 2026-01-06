{
  #NOTE: Esto es un machete/recordatorio para ciertos patrones de codigo en nixos

  #NOTE: Fetchear, leer y convertir un archivo desde TMOL a Nix
  settings = lib.mkForce (builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
      owner = "fredericrous";
      repo = "dotfiles";
      rev = "cf793fb3f87f8de1eb2e7c90a23252226d8aaf70";
      hash = "sha256-yr6HasmCorNsVRVeix3OM5Acqwk7K23HCvMMqyi0RT8=";
    }
    + "/private_dot_config/starship.toml")));

  #NOTE: Direccion dentro de un paquete (ejemplo fuente de letra), encontrar usando fzf
  terminal.font = "${pkgs.nerd-fonts.sauce-code-pro}/share/fonts/truetype/NerdFonts/SauceCodePro/SauceCodeProNerdFont-Regular.ttf";

  #NOTE: comando para hacer ISO:
  # nix run nixpkgs#nixos-generators -- --format iso --flake /home/ruiz/Documentos/GitHub/nixos/main#portable -o result

  #NOTE: fetchear custom pkg nixos
  fonts.packages = with pkgs; [
    (callPackage ./../../modulos/nixconfig/custompkgs/hashtag.nix {
      inherit lib;
      inherit pkgs;
    })
  ];

  #NOTE: Asi se lee y fetch un archivo remoto
  ".config/starship.toml".text = builtins.readFile (pkgs.fetchFromGitLab {
      owner = "pinage404";
      repo = "dotfiles";
      rev = "3b767b3ac29cf33221a8f25642c3c433bfc95b84";
      hash = "sha256-1JVGpp83PcpXA0wEl7m/WxaDppf0EvwMB2nhzvLwBg8=";
    }
    + "/dotfiles/config/starship.toml");

  #NOTE: fetch un directorio entero
  # fetchTree #NOTE: puede ser util
  # {
  #   type = "github";
  #   owner = "akshat46";
  #   repo = "FlyingFox";
  #   # dir = "chrome";
  #   rev = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
  # };
  # recursive = true;
  # };

  #       #NOTE: prueba de login:
  #       # sddm-greeter-qt6 --test-mode --theme /run/current-system/sw/share/sddm/themes/sddm-astronaut-theme
}
