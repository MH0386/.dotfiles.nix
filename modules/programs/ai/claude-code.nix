{
  den.default = {
    homeManager.programs.claude-code = {
      enable = true;
      enableMcpIntegration = true;
      settings = {
        env = {
          ANTHROPIC_API_KEY = "";
          ANTHROPIC_BASE_URL = "https://api.kilo.ai/api/gateway";
        };
      };
    };
  };
}
