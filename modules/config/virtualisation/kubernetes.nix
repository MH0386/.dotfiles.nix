{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.kubernetes
          pkgs.kubectl
          pkgs.kompose
          pkgs.seabird
        ];
      };
  };
}
