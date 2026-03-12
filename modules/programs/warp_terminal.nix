{
  den.schema.conf = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.warp-terminal ];
      };
  };
}
