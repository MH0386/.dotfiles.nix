{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = [ pkgsStable.upscaler ];
      };
  };
}
