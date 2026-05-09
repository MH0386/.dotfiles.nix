{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.nushell = {
          enable = true;
          plugins = [ pkgs.nushellPlugins.gstat ];
        };
      };
  };
}
