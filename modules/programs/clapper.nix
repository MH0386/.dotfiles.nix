{ delib, pkgs, ... }:
delib.module {
  name = "clapper";

  options.clapper = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.clapper ];
}
