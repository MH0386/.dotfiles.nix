{ delib, pkgs, ... }:
delib.module {
  name = "clapper";

  options.clapper = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.clapper ];
}
