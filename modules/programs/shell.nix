{
  den.schema.conf = {

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
        programs.atuin = {
          enable = true;
          daemon.enable = true;
          enableBashIntegration = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
          enableZshIntegration = true;
          settings = {
            style = "auto";
          };
        };
        programs.carapace = {
          enable = true;
          enableBashIntegration = true;
          enableFishIntegration = true;
          enableZshIntegration = true;
          enableNushellIntegration = true;
        };
        programs.starship = {
          enable = true;
          settings = {
            format = "$all";
          };
          enableBashIntegration = true;
          enableFishIntegration = true;
          enableZshIntegration = true;
          enableNushellIntegration = true;
        };
        programs.zoxide.enable = true;
        programs.command-not-found.enable = true;
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
