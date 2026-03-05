{ delib, pkgsStable, ... }:
delib.module {
  name = "gitbutler";

  options.gitbutler = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.gitbutler ];
}
