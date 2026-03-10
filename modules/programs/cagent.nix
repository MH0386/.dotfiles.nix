{ delib, pkgs, ... }:
delib.module {
  name = "cagent";

  options.cagent = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.cagent ];
}
