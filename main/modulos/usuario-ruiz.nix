{pkgs, ...}: {
  users.users = {
    Ruiz = {
      isNormalUser = true;
      description = "Mariano Ruiz";
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = "$y$j9T$130s2ATsRL5ixDudKitBG/$bqE8TWji9UmfWrZgX/791zqONEFPu7ivzPS/PmjN0j7";
    };
  };

}
