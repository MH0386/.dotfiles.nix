{ delib, pkgs, ... }:
delib.module {
  name = "bat";

  options.bat = with delib; {
    enable = singleEnableOption true;
    extraPackages = listOptionOf plugin [
      pkgs.bat-extras.batdiff
      pkgs.bat-extras.batman
      pkgs.bat-extras.batgrep
      pkgs.bat-extras.batwatch
      pkgs.bat-extras.batpipe
      pkgs.bat-extras.prettybat
    ];
  };

  home.ifEnabled.programs.bat =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) extraPackages;
    };
}
