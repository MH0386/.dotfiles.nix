{
  den.default = {
    homeManager = {
      programs.gemini-cli = {
        enable = true;
        enableMcpIntegration = true;
        settings = {
          security = {
            auth = {
              selectedType = "oauth-personal";
            };
          };
          ide = {
            hasSeenNudge = true;
            enabled = true;
          };
        };
      };
    };
  };
}
