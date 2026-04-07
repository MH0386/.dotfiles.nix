{
  den.default = {
    homeManager =
      { pkgsStable, ... }:
      {
        home.packages = with pkgs; [          corepack
        ];
      };
  };
}
