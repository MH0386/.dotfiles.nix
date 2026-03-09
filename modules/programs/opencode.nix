{ delib, pkgs, lib, ... }:
delib.module {
  name = "opencode";

  options.opencode = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      home={
        packages = [ pkgs.opencode-desktop ];
        sessionVariables = { EDITOR="${lib.getExe pkgs.vscodium} --wait"; };
      };
      programs.opencode = {
        inherit (cfg) enable;
        enableMcpIntegration = true;
        settings = {
          plugin = [
            "opencode-daytona"
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
}
