{
  pkgs,
  inputs,
  ...
}: {
  programs.librewolf = {
    enable = true;
    languagePacks = ["es-AR"];
    settings = [
    ];
  };
}
