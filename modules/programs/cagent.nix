{ delib, pkgs, ... }:
delib.module {
  name = "cagent";

  options.cagent = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.cagent ];
}
