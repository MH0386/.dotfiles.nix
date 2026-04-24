{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.codex = {
          enable = true;
          # enableMcpIntegration = true;
        };
        home.packages = [
          pkgs.codex-acp
        ];
      };
  };
}
