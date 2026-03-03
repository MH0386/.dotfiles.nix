{ delib, pkgs, ... }:
delib.module {
  name = "bottles";

  options.bottles = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.bottles ];
}
