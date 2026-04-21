{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.opencode-desktop ];
        programs.opencode = {
          enable = true;
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
