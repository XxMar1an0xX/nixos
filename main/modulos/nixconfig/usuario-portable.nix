{pkgs, ...}: {
  users.users = {
    portable = {
      isNormalUser = true;
      description = "portable ";
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = "$y$j9T$FBd2m8UD9gZQFSBLZlk.N0$URtutPSPulECzvPHX5.Q2quC4VFSL.nYN7/jCj5Kky6";
    };
  };
}
