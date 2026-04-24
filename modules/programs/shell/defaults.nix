{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home = {
          packages = with pkgs; [
            undollar
            atuin-desktop
          ];
          shellAliases = {
            ll = "ls -l";
            la = "ls -la";
            l = "ls";
            c = "clear";
            h = "history";
          };
        };
        programs = {
          atuin = {
            daemon = {
              enable = true;
              logLevel = "info";
            };
            enable = true;
            enableBashIntegration = true;
            enableFishIntegration = true;
            enableNushellIntegration = true;
            enableZshIntegration = true;
            settings = {
              style = "auto";
              auto_sync = true;
              sync_frequency = "5m";
              sync.records = true;
              dotfiles.enabled = true;
              ai = {
                enabled = true;
                opening = {
                  send_cwd = true;
                  send_last_command = true;
                };
              };
            };
          };
          carapace = {
            enable = true;
            enableBashIntegration = true;
            enableFishIntegration = true;
            enableNushellIntegration = true;
            enableZshIntegration = true;
          };
          starship = {
            enable = true;
            enableBashIntegration = true;
            enableFishIntegration = true;
            enableNushellIntegration = true;
            enableZshIntegration = true;
            settings = {
              format = "$all";
            };
          };
          zoxide = {
            enable = true;
          };
        };
      };
  };
}
