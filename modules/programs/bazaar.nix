{ delib, pkgs, ... }:
delib.module {
  name = "bazaar";

  options.bazaar = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.bazaar ];
}
