{
  inputs,
  config,
  ...
}: let
  CondicionalPortable = Si: No: (
    if config.custom.HacerPortable
    then Si
    else No
  );
in {
  services.ollama = CondicionalPortable {} {
    enable = true;
    # if (config.custom.HacerPortable == true)
    # then true
    # else false;
    openFirewall = true;
    loadModels = ["llama3"];
  };
}
