{
  lib,
  pkgs,
  ...
}: {
  #NOTE: opcion hacerportable custom
  options = {
    HacerPortable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
    };
  };
}
