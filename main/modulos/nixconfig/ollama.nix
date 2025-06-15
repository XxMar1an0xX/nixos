{inputs, ...}: {
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = ["llama3"];
  };
}
