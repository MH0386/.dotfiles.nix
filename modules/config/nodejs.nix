{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = with pkgsStable; [ corepack ];
        bun.enable = true;
      };
  };
}
