{ delib, pkgs, ... }:
delib.module {
  name = "bazaar";

  options.bazaar = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.bazaar ];
}
