{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          kubernetes
          kubectl
          kompose
        ];
      };
  };
}
