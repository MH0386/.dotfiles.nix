{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.python3Packages.python-lsp-server ];
      };
  };
}
