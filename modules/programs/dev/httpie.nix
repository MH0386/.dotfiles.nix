{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.httpie
          pkgs.httpie-desktop
        ];
      };
  };
}
