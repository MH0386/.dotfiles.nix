{ delib, pkgs, ... }:
delib.module {
  name = "gitbutler";

  options.gitbutler = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.gitbutler ];
}
