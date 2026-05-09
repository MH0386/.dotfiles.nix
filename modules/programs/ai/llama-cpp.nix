{
  den.default = {
    nixos.services.llama-cpp = {
      enable = true;
      openFirewall = true;
    };
  };
}
