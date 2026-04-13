{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = with pkgsStable; [ corepack ];
      };
  };
}
