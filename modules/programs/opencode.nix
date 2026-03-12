{
  den.schema.conf = {
    homeManager =
      { pkgs, lib, ... }:
      {
        home = {
          packages = [ pkgs.opencode-desktop ];
          sessionVariables = {
            EDITOR = "${lib.getExe pkgs.vscodium} --wait";
          };
        };
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
