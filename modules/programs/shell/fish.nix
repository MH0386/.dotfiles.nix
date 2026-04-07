{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.fish = {
          enable = true;
          # interactiveShellInit = "${lib.getExe config.programs.fastfetch.package}";
          plugins = [
            {
              name = "fzf";
              inherit (pkgs.fishPlugins.fzf) src;
            }
            {
              name = "done";
              inherit (pkgs.fishPlugins.done) src;
            }
            {
              name = "grc";
              inherit (pkgs.fishPlugins.grc) src;
            }
          ];
        };
      };
  };
}
