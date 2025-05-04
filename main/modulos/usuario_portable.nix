{pkgs, ...}: {
  users.users.Mariano = {
    isNormalUser = true;
    description = "Mariano Ruiz";
    home = "/home/mariano";
    name = "mariano";
    hashedPassword = "$y$j9T$/bt4xeXtU77I0ADke6Zmx0$X2fa2NKPLSodUMUa.5abyrdtnjs2M3/0OtDdcfbXi80";
    extraGroups = ["networkmanager" "wheel"];
    shell = "/bin/sh";
  };
}
