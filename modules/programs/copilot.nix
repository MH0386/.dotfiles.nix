{
  den.schema.conf = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.github-copilot-cli ];
      };
  };
}
