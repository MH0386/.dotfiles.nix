{
  den.default = {
    nixos = {
      programs.localsend = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
