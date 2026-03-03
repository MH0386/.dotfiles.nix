{ delib, pkgs, ... }:
delib.module {
  name = "gitbutler";

  options.gitbutler = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.gitbutler ];
}
