{ delib, pkgs, ... }:
delib.module {
  name = "warehouse";

  options.warehouse = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.warehouse ];
}
