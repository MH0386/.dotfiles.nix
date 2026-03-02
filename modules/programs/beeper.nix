{ delib, pkgs, ... }:
delib.module {
  name = "beeper";

  options.beeper = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.beeper ];
}
