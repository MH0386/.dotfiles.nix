{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.warp-terminal ];
        home.sessionVariables = {
          WARP_ENABLE_WAYLAND = "1";
        };
      };
  };
}
