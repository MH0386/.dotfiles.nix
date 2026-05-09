{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          just
          just-lsp
          just-formatter
        ];
      };
  };
}
