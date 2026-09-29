{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.bitwarden-cli
          pkgs.bitwarden-desktop
        ];
      };
  };
}
