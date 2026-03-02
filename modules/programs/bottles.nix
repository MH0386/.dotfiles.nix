{ delib, pkgs, ... }:
delib.module {
  name = "bottles";

  options.bottles = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.bottles ];
}
