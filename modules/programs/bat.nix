{ delib, pkgs, ... }:
delib.module {
  name = "bat";

  options.bat = with delib; {
    enable = boolOption true;
    extraPackages = listOption [
      pkgs.bat-extras.batdiff
      pkgs.bat-extras.batman
      pkgs.bat-extras.batgrep
      pkgs.bat-extras.batwatch
      pkgs.bat-extras.batpipe
      pkgs.bat-extras.prettybat
    ];
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.bat = {
        inherit (cfg) enable;
        inherit (cfg) extraPackages;
      };
    };
}
