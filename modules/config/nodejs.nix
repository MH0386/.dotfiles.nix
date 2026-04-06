{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = with pkgsStable; [
          nodejs_22
          corepack
        ];
      };
  };
}
