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

    provides = {
      bash = {
        homeManager.programs.bash.enable = true;
      };
      zsh = {
        nixos.programs.zsh.enable = true;
        homeManager.programs.zsh = {
          enable = true;
          autosuggestion.enable = true;
        };
      };
      fish = {
        homeManager.programs.fish.enable = true;
      };
      nushell =
        { pkgs, ... }:
        {
          homeManager.programs.nushell = {
            enable = true;
            plugins = [ pkgs.nushellPlugins.gstat ];
          };
        };
      xonsh = {
        nixos.programs.xonsh = {
          enable = true;
          config = "execx($(atuin init xonsh))";
        };
      };
    };
  };
}
