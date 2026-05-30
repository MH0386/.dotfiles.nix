{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.socat ];
      };
  };
}
