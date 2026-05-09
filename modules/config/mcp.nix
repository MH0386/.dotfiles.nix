{
  den.default = {
    homeManager =
      { lib, pkgsStable, ... }:
      {
        programs.mcp = {
          enable = true;
          servers = {
            nixos = {
              command = "${lib.getExe pkgsStable.mcp-nixos}";
            };
            github = {
              url = "https://api.githubcopilot.com/mcp";
              headers = {
                Authorization = "{env:GITHUB_PERSONAL_ACCESS_TOKEN}";
              };
            };
            agno = {
              url = "https://docs.agno.com/mcp";
            };
            context7 = {
              url = "https://mcp.context7.com/mcp";
              headers = {
                CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
              };
            };
          };
        };
      };
  };
}
