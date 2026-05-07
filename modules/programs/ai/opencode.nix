{ inputs, ... }:
{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.opencode-desktop ];
        programs.opencode = {
          enable = true;
          package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
          enableMcpIntegration = true;
          settings = {
            plugin = [
              "opencode-wakatime"
              "@mohak34/opencode-notifier"
              "oh-my-openagent"
              "@franlol/opencode-md-table-formatter"
              "@plannotator/opencode"
              "@tarquinen/opencode-dcp"
              "opencode-websearch-cited"
              "opencode-pty"
              "@warp-dot-dev/opencode-warp"
            ];
          };
        };
      };
  };
}
