{self, ...}: {
  home.file = {
    "Arduino-cli Libraries" = {
      target = "$HOME/hola/";
      src = "${
        self.packages.arduino-cli
      }";
    };
  };
}
