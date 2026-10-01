{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.bat = {
          enable = true;
          extraPackages = [
            pkgs.bat-extras.batdiff
            pkgs.bat-extras.batman
            pkgs.bat-extras.batgrep
            pkgs.bat-extras.batwatch
            pkgs.bat-extras.batpipe
            pkgs.bat-extras.prettybat
          ];
        };
      };
  };
}
