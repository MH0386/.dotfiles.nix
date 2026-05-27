{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home = {
          packages = [ inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.copilot-cli ];
          sessionVariables = {
            COPILOT_PROVIDER_BASE_URL = "https://api.kilo.ai/api/gateway";
            COPILOT_PROVIDER_API_KEY = "$KILO_API_KEY";
            COPILOT_MODEL = "kilo-auto/free";
          };
        };
      };
  };
}
