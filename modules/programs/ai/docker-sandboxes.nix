{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.nur.repos.MH0386.docker-sandboxes ];
      };
  };
}
