{ delib, pkgs, ... }:
delib.module {
  name = "beeper";

  options.beeper = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.beeper ];
}
