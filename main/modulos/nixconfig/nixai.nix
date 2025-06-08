{}: {
  imports = [
  ];
  services.nixai = {
    enable = true;
    mcp = {
      enable = true;
      socketPath = "/run/nixai/mcp.sock";
      host = "localhost";
      port = 8081;
      documentationSources = [
        "https://wiki.nixos.org/wiki/NixOS_Wiki"
        "https://nix.dev/manual/nix"
        "https://nixos.org/manual/nixpkgs/stable/"
        "https://nix.dev/manual/nix/2.28/language/"
        "https://nix-community.github.io/home-manager/"
      ];
      aiProvider = "ollama"; # Options: "ollama", "gemini", "openai"
      aiModel = "llama3";
    };
    config = {
      # Additional configuration to merge into config.yaml
      # This is optional
    };
  };
}
