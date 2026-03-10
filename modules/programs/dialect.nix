{ delib, pkgs, ... }:
delib.module {
  name = "dialect";

  options.dialect = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.dialect ];
}
