{
  inputs,
  config,
  CondicionalPortable,
  ...
}: {
  services.ollama = CondicionalPortable {} {
    enable = true;
    # if (config.custom.HacerPortable == true)
    # then true
    # else false;
    openFirewall = true;
    loadModels = ["llama3"];
  };
}
