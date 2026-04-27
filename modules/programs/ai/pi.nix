{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.pi-coding-agent ];
      };
  };
}
