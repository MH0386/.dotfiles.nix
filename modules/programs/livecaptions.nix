{
  den.schema.conf = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = [ pkgsStable.livecaptions ];
      };
  };
}
