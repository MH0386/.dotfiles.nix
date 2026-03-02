{ delib, ... }:
delib.module {
  name = "mcp";

  options.mcp = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.mcp =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      servers = {
        nixos = {
          command = "uvx";
          args = [ "mcp-nixos" ];
        };
        github = {
          url = "https://api.githubcopilot.com/mcp";
        };
        agno = {
          url = "https://docs.agno.com/mcp";
        };
        devenv = {
          command = "devenv";
          args = [
            "mcp"
          ];
        };
        git = {
          command = "uvx";
          args = [
            "mcp-server-git"
          ];
        };
        time = {
          command = "uvx";
          args = [
            "mcp-server-time"
          ];
        };
        context7 = {
          url = "https://mcp.context7.com/mcp";
          headers = {
            CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
          };
        };
      };
    };
}
