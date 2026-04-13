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
              "opencode-notificator"
              "opencode-notifier"
              "oh-my-opencode"
              "opencode-md-table-formatter"
              "opencode-skillful"
              "micode"
              "opencode-workspace"
              "opencode-worktree"
            ];
          };
        };
      };
  };
}
