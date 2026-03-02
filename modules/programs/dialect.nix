{ delib, pkgs, ... }:
delib.module {
  name = "dialect";

  options.dialect = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.dialect ];
}
