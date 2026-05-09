{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.codex = {
          enable = true;
          package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.codex;
          # enableMcpIntegration = true;
        };
      };
  };
}
