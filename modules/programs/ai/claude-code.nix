{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.claude-code = {
          enable = true;
          package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.claude-code;
          enableMcpIntegration = true;
          settings = {
            env = {
              ANTHROPIC_API_KEY = "";
              ANTHROPIC_BASE_URL = "https://api.kilo.ai/api/gateway";
            };
          };
        };
      };
  };
}
