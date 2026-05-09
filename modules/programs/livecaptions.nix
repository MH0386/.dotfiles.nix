{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = [ pkgsStable.livecaptions ];
      };
  };
}
