{ delib, pkgs, ... }:
delib.module {
  name = "warehouse";

  options.warehouse = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.warehouse ];
}
