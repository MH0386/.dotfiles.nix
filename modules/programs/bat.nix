{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        programs.bat = {
          enable = true;
          extraPackages = with pkgs.bat-extras; [
            batdiff
            batman
            batgrep
            batwatch
            batpipe
            prettybat
          ];
        };
      };
  };
}
