{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.proton-pass
          pkgs.proton-authenticator
        ];
      };
  };
}
