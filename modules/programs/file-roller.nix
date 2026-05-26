{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ file-roller ];
      };
  };
}
