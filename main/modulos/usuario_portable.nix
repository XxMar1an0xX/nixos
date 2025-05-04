{lib, config, ...}: {
  users.extraUsers.NixPortable = {
    isNormalUser = true;
    description = "ususario portable";
    password = "nixvim";
    name = "Portable";
  };
}
