{
  #NOTE: Esto es un machete/recordatorio para ciertos patrones de codigo en nixos

  #NOTE: obtener hash ser como:
  #   #nix hash to-sri --type sha256 $(nix-prefetch-url https://dl.dafont.com/dl/?f=hashtag)

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
  # nix run nixpkgs#nixos-generators -- --format iso --flake /home/ruiz/Documentos/GitHub/nixosmain#portable -o result

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

  #NOTE: Asi se lee y fetch un archivo remoto
  # ".config/starship.toml".text = builtins.readFile (pkgs.fetchFromGitLab {
  #     owner = "pinage404";
  #     repo = "dotfiles";
  #     rev = "3b767b3ac29cf33221a8f25642c3c433bfc95b84";

  #       #NOTE: prueba de login:
  #       # sddm-greeter-qt6 --test-mode --theme /run/current-system/sw/share/sddm/themes/sddm-astronaut-theme
  #NOTE: asi se obtiene el path de las librerias arduino-cli

  path = "${builtins.getAttr "userPath" outputs.packages.x86_64-linux.arduino}";

  #NOTE: repo de github
  # github:XxMar1an0xX/nixos
  # https://github.com/XxMar1an0xX/nixos.git

  #NOTE: symlink from store
  # "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixosdotfiles/niri/config.kdl"; significa "hacer un symlink de ~/.config/niri/config.kdl a /etc/nixosdotfiles/niri/config.kdl"

  #NOTE: comando para instalas nixos es:
  # sudo nixos-rebuild switch --flake github:XxMar1an0xX/nixos --extra-experimental-features 'nix-command flakes'
  #NOTE: para hacer que fetche lo mas nuevo es: --option tarball-ttl 0

  #NOTE: puede ser util para fetchear directorios
  # fetchTree
  # {
  #   type = "github";
  #   owner = "akshat46";
  #   repo = "FlyingFox";
  #   # dir = "chrome";
  #   rev = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
  # };
  #   recursive = true;
  # };

  #NOTE: comando para deploy laptop desde entorno de instalacion:
  #  sudo nix --extra-experimental-features 'nix-command flakes' run 'github:nix-community/disko/latest#disko-install' -- --write-efi-boot-entries --flake 'github:XxMar1an0xX/nixos#laptop' --disk main /dev/sda --option tarball-ttl 0

  #NOTE: testeo del flake:
  # nix flake check --print-build-logs --all-systems $CONFIG

  #NOTE: instalacion desde USB ISO comandos:
  # sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake github:XxMar1an0xX/nixos#laptopNoSops
  # sudo nixos-install --no-root-passwd --flake github:XxMar1an0xX/nixos#laptopNoSops --option max-jobs 1
}
#NOTE

