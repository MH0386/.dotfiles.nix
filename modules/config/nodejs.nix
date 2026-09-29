{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = [ pkgsStable.corepack ];
        programs = {
          bun.enable = true;
          npm.enable = true;
        };
      };
  };
}
