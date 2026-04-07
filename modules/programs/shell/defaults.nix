{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home = {
          packages = with pkgs; [ undollar ];
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
            };
            enable = true;
            enableBashIntegration = true;
            enableFishIntegration = true;
            enableNushellIntegration = true;
            enableZshIntegration = true;
            settings = {
              style = "auto";
            };
          };
          carapace = {
            enable = true;
            enableBashIntegration = true;
            enableFishIntegration = true;
            enableNushellIntegration = true;
            enableZshIntegration = true;
          };
          command-not-found = {
            enable = true;
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
